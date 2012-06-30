#
# Author:: Sebastian Wendel
# Cookbook Name:: elasticsearch
# Attribute:: default
#
# Copyright 2012, SourceIndex IT-Services
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

# SERVER BINARY
default['elasticsearch']['server_version'] = "0.19.7"
default['elasticsearch']['server_url'] = "https://github.com/downloads/elasticsearch"
default['elasticsearch']['server_file'] = "elasticsearch-#{node['elasticsearch']['server_version']}.tar.gz"
default['elasticsearch']['server_download'] = "#{node['elasticsearch']['server_url']}/elasticsearch/#{node['elasticsearch']['server_file']}"
default['elasticsearch']['server_checksum'] = "2a4b0aa6853e6abc1328bc7107f80cd4dcdd4ef15e88ca4d44cb0c5f8560014e"

# SERVICE-WRAPPER BINARY
default['elasticsearch']['servicewrapper_version'] = "d47d048"
default['elasticsearch']['servicewrapper_url'] = "https://github.com/elasticsearch"
default['elasticsearch']['servicewrapper_file'] = "elasticsearch-elasticsearch-servicewrapper-#{node['elasticsearch']['servicewrapper_version']}.tar.gz"
default['elasticsearch']['servicewrapper_download'] = "#{node['elasticsearch']['servicewrapper_url']}/elasticsearch-servicewrapper/tarball/master"
default['elasticsearch']['servicewrapper_checksum'] = "8d2f46993dec203e23bbb5d16b90898a15761c7906feb466436858c91ae93c31"

# SERVER PLUGINS
default['elasticsearch']['plugins'] = "lukas-vlcek/bigdesk, Aconex/elasticsearch-head"

# SERVER CONFIG
default['elasticsearch']['server_path'] = "/usr/share/elasticsearch"
default['elasticsearch']['server_etc'] = "/etc/elasticsearch"
default['elasticsearch']['server_pid'] = "/var/run/elasticsearch"
default['elasticsearch']['server_lock'] = "/var/lock/elasticsearch"
default['elasticsearch']['server_logs'] = "/var/log/elasticsearch"
default['elasticsearch']['server_data'] = "/var/lib/elasticsearch"
default['elasticsearch']['server_plugins'] = "#{node['elasticsearch']['server_path']}/plugins"
default['elasticsearch']['server_user'] = "elasticsearch"
default['elasticsearch']['server_group'] = "elasticsearch"
default['elasticsearch']['server_ulimit'] = 64000
default['elasticsearch']['clustername'] = "elasticsearch"
default['elasticsearch']['number_shards'] = 5
default['elasticsearch']['number_replicas'] = 1 
default['elasticsearch']['bind_host'] = "0.0.0.0"
default['elasticsearch']['publish_host'] = nil
default['elasticsearch']['port_tcp'] = nil
default['elasticsearch']['port_http'] = nil
default['elasticsearch']['http_disable'] = false
default['elasticsearch']['mem_mlock'] = true
default['elasticsearch']['mem_heap'] = "#{(node['memory']['total'].to_i - (node['memory']['total'].to_i/3) ) / 1024}m"

