# Description #
Installs elasticsearch the painless JSON over HTTP enabled search server, who is always available and built for the cloud.

Uses the stable release provided as tar.gz from github and the recommended java service-wrapper. The cookbook also provides the Plugin installation.

# Requirements #

## Platform ##
The Cookbooks is Tested on following platforms:
* Debian, Ubuntu
* CentOS, Red Hat

## Cookbooks ##
The following Opscode cookbooks are dependencies:
* java

# Recipes #
Just include the elasticsearch cookbock in your runlist or server role with the following hash table:

  {
    "run_list": [
      "recipe[elasticsearch]"
    ]
  }

This will install the elasticsearch server, the java dependencies and the plugins.

# Attributes #
## Defaults ##
* `node['elasticsearch']['server_version']` - the version you whant to install, like "0.19.3".
* `node['elasticsearch']['server_checksum']` - the sha256 of binery tar.gz from github.
* `node['elasticsearch']['clustername']` - the name of the cluster if you whant to seaperate them, default is "elasticsearch".
* `node['elasticsearch']['number_shards']` - set the active shards that are available, default is "5".
* `node['elasticsearch']['number_replicas']` - set the number of replicasthat are available, default is "1".
* `node['elasticsearch']['mem_heap']` - set java heap size in megabyte , the default will calculate 2/3 of avalable system memory.
* `node['elasticsearch']['mem_mlock']` - set mlockall to lock all available memory, default is "true".

## Plugins  ##

* `node['elasticsearch']['plugins']` - provide a comma seperated list includin github name and projekt like the following defaults "lukas-vlcek/bigdesk, Aconex/elasticsearch-head"
For more infromation on elasticsearch plugins go to:
* http://www.elasticsearch.org/guide/reference/modules/plugins.html

# Usage #
Simply include the recipe where you want elasticsearch installed.

# ToDos and Issues #
Have a lock at the github issues section. There's still some work to do, patches are welcome.

# License and Author #

Author Sebastian Wendel (<packages@sourceindex.de>)
Copyright 2012, SourceIndex IT-Serives

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
