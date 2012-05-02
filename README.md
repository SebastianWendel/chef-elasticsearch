## Description ##

## Dependencies ##

bin/plugin -install sonian/elasticsearch-jetty
bin/plugin -install Aconex/elasticsearch-head
bin/plugin -install lukas-vlcek/bigdesk
bin/plugin -install richardwilly98/elasticsearch-river-mongodb
bin/plugin -install dadoonet/rssriver
bin/plugin -install elasticsearch/elasticsearch-river-rabbitmq
bin/plugin -install elasticsearch/elasticsearch-river-twitter
bin/plugin -install elasticsearch/elasticsearch-river-wikipedia
bin/plugin -install elasticsearch/elasticsearch-river-couchdb

https://raw.github.com/sonian/elasticsearch-jetty/master/config/jetty.xml
https://raw.github.com/sonian/elasticsearch-jetty/master/config/logging.yml
https://raw.github.com/sonian/elasticsearch-jetty/master/config/jetty-minimal.xml
https://raw.github.com/sonian/elasticsearch-jetty/master/config/elasticsearch.yml

vagrant@ubuntu10044:/usr/local/elasticsearch/current$ ll config/            
-rw-r--r-- 1 elasticsearch elasticsearch 12352 2012-04-29 23:33 elasticsearch.yml
-rw-r--r-- 1 elasticsearch elasticsearch  1036 2012-04-29 23:33 logging.yml

https://github.com/coroutine/chef-elasticsearch/blob/master/attributes/default.rb

WRAPPER_CONF="$ES_HOME/bin/service/elasticsearch.conf"


### Recipes ###

### default ###

## Usage ##

## License and Author ##

Author:: Sebastian Wendel

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

