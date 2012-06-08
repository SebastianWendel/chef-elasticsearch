#
# Cookbook Name:: elasticsearch
# Recipe:: jetty
#
# Copyright 2012, SourceIndex IT-Serives
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

server_path      = node['elasticsearch']['server_path']
server_etc       = node['elasticsearch']['server_etc']
server_plugins   = node['elasticsearch']['server_plugins']
es_jetty_repo    = node['elasticsearch']['es_jetty_repo']
es_jetty_version = node['elasticsearch']['es_jetty_version']

include_recipe  "elasticsearch::server"

# check if file exists? If not notifie and breckup
# https://github.com/downloads/sonian/elasticsearch-jetty/elasticsearch-jetty-0.19.3.zip

template "#{server_etc}/jetty.xml" do
  source "jetty.xml.erb"
  owner "root"
  group "root"
  mode 0644
end

template "#{server_etc}/jetty-ssl.xml" do
  source "jetty-ssl.xml.erb"
  owner "root"
  group "root"
  mode 0644
end

template "#{server_etc}/elasticsearch.yml" do
  source "elasticsearch-jetty.yml.erb"
  owner "root"
  group "root"
  mode 0644
end

template "#{server_etc}/realm.properties" do
  source "realm.properties.erb"
  owner "root"
  group "root"
  mode 0644
end

unless FileTest.exists?("#{server_plugins}/jetty")
  ruby_block "install jetty servlet container" do
    block do
      cmd = Chef::ShellOut.new(%Q[ #{server_path}/bin/plugin -install #{es_jetty_repo} ]).run_command
      Chef::Log.info("installed the jetty servlet container")
    end
    action :create
  end

  service "elasticsearch" do
    supports :start => true, :stop => true, :restart => true, :status => true
    action [:restart]
  end
end
