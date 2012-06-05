maintainer        "Sebastian Wendel, SourceIndex IT-Services"
maintainer_email  "packages@sourceindex.de"
license           "Apache 2.0"
description       "Installs and configures Elasticsearch Indexer"
version           "0.1.0"
recipe            "elasticsearch", "Installs and configures elasticsearch"

%w{redhat centos ubuntu debian}.each do |os|
  supports os
end

depends "java"
