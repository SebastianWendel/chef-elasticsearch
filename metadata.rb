maintainer        "Sebastian Wendel, SourceIndex IT-Services"
maintainer_email  "packages@sourceindex.de"
license           "Apache 2.0"
description       "Installs and configures Elasticsearch Indexer"
version           "0.0.2"
recipe            "elasticsearch", "Installs and configures elasticsearch"

supports "ubutnu", "== 10.04"
supports "ubutnu", "== 12.04"
supports "debian", ">= 6.0"

%w{redhat centos}.each do |os|
  supports os, "== 5.8"
  supports os, ">= 6.0"
end

depends "java"
