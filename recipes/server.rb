#
# Cookbook Name:: elasticsearch
# Recipe:: server
#
# Copyright 2013, SourceIndex IT-Serives
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

server_user                 = node['elasticsearch']['server_user']
server_group                = node['elasticsearch']['server_group']
server_url                  = node['elasticsearch']['server_url']
server_path                 = node['elasticsearch']['server_path']
server_etc                  = node['elasticsearch']['server_etc']
server_pid                  = node['elasticsearch']['server_pid']
server_lock                 = node['elasticsearch']['server_lock']
server_plugins              = node['elasticsearch']['server_plugins']
server_logs                 = node['elasticsearch']['server_logs']
server_data                 = node['elasticsearch']['server_data']
servicewrapper_url          = node['elasticsearch']['servicewrapper_url']
plugins                     = node['elasticsearch']['plugins']

include_recipe "java"

group server_group do
    system true
end

user server_user do
    home server_data
    gid server_group
    shell "/bin/bash"
end

[server_path, server_etc, server_plugins].each do |folder|
    directory folder do
        owner "root"
        group "root"
        mode "0755"
    end
end

[server_pid, server_lock, server_data, server_logs].each do |folder|
    directory folder do
        owner server_user
        group server_group
        mode "0755"
    end
end

unless FileTest.exists?("#{server_path}/bin/plugin")
    bash "download latest and extract elasticsearch sources" do
        cwd Chef::Config[:file_cache_path]
        code <<-EOH
            wget $(wget -qO- #{server_url} | grep -e download | grep '.tar.gz' | grep -v sha | grep -v 'RC' | cut -d'"' -f4)
            tar -zxf elasticsearch-*.tar.gz
            cp -rf elasticsearch-*/bin elasticsearch-*/lib #{server_path}
            rm -f elasticsearch-*.tar.*
        EOH
    end
end

unless FileTest.exists?("#{server_path}/bin/service/elasticsearch")
    bash "extract elasticsearch service wrapper" do
        cwd Chef::Config[:file_cache_path]
        code <<-EOH
            rm -rf elasticsearch-servicewrapper-master
            wget #{servicewrapper_url}
            unzip master.zip
            rm -f elasticsearch-servicewrapper-master/README
            mv elasticsearch-servicewrapper-master/* #{server_path}/bin
            rm -f master.zip
        EOH
    end
end

template "/etc/init.d/elasticsearch" do
    source "elasticsearch-init.erb"
    owner "root"
    group "root"
    mode 0755
end

link "#{server_path}/config" do
    to server_etc
end

link "#{server_path}/logs" do
    to server_logs
end

link "#{server_path}/data" do
    to server_data
end

link "/usr/bin/elasticsearch-plugins" do
    to "#{server_path}/bin/plugin"
end

template "#{server_etc}/elasticsearch.conf" do
    source "elasticsearch.conf.erb"
    owner "root"
    group "root"
    mode 0644
    notifies :restart, 'service[elasticsearch]'
end

template "#{server_etc}/elasticsearch.yml" do
    source "elasticsearch.yml.erb"
    owner "root"
    group "root"
    mode 0644
    notifies :restart, 'service[elasticsearch]'
end

template "#{server_etc}/logging.yml" do
    source "logging.yml.erb"
    owner "root"
    group "root"
    mode 0644
    notifies :restart, 'service[elasticsearch]'
end

ruby_block "install elasticsearch plugins" do
    block do
        plugins.split(',').each do |plugin_url|
            plugin_name = plugin_url.split('/').last.split('-').last
            plugins_installed = Dir.foreach(server_plugins)
            unless plugins_installed.any? { |plugins_any| plugins_any.include?("#{plugin_name}") }
                Chef::Log.info("install elasticsearch plugin #{plugin_url}")
                cmd = Chef::ShellOut.new(%Q[ #{server_path}/bin/plugin -install #{plugin_url} ]).run_command
            end
        end
    end
    action :create
end

service "elasticsearch" do
    supports :restart => true, :status => true
    action [:enable, :start]
end
