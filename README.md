# puppet-elasticsearch

## Description

A Puppet report handler for sending notifications to Elasticsearch.

## Requirements
 
 ```
tire
puppet
```
## Installation & Usage

1. Install the `tire` gem on your Puppet master:
`$ sudo puppetserver gem install activesupport -v 4.2.9 --no-ri`
`$ sudo puppetserver gem install tire -f`
`$ sudo systemctl restart puppetserver`
2. Install puppet-elsticsearch as a module in your Puppet master's module path.

3. Update the elasticsearch_url variable in the /etc/puppet/elasticsearch.yaml with your Elasticserver, for example http://127.0.0.1:9200. An example file is included.

4. Enable elasticsearch report processor on your master puppet.conf.

```
[master]
report = true
reports = elasticsearch
Enable reporting in client puppet.conf
```

 ```
 [agent]
 report = true
 ```
5. Run the Puppet client and sync the report as a plugin

### Author

Forked from Arno Broekhof arnobroekhof@gmail.com repository. Further development by Valery Zabauski dziki_jam@mail.ru

### License

Author:: Arno Broekhof (arnobroekhof@gmail.com)
Copyright:: Copyright (c) 2013 Arno Broekhof
License:: Apache License, Version 2.0

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
TODO

 - [ ] Separate message fields, make report processor form a proper structure for Elasticsearch.
 - [ ] Create a familiar dashboard as Grafana dashboard for Prometeus data source has.
 - [ ] Migrate to an up-to-date implementation of Elasticsearch client.
