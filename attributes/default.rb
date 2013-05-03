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
default['elasticsearch']['server_url'] = "http://www.elasticsearch.org/download/"

# SERVICE-WRAPPER BINARY
default['elasticsearch']['servicewrapper_url'] = "https://github.com/elasticsearch/elasticsearch-servicewrapper/archive/master.zip"

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

