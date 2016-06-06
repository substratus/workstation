
# Substratus

Makes a Docker environment easy again, by providing, out of the box:

  * Monitoring and log aggregation via Fluentd, ElasticSearch and Kibana.
  * NGINX reverse proxy with proper hostnames for local development.

## What is this for?

  * Development environments
  * Staging and release candidate QA environments
  * Feature-branch demos
  * Production environments

## Layout

### Development, CI, feature-branch demo

|   | Development | CI | Feature-Branch Demo | Production |
|---|-------------|----|---------------------|------------|
| setup | monitor.yml | monitor.yml | monitor.yml | CloudFormation |
| fluentd | monitor.yml | monitor.yml | monitor.yml | Separate container on each CoreOS node. |
| elasticsearch | monitor.yml | monitor.yml | monitor.yml | Separate container on each CoreOS node. |
| nginx | monitor.yml | monitor.yml | Use ELB instead | Use ELB instead |

### Production

## Is this production ready?

No.

## TODO

  * Improve documentation with:
    * usage examples
    * screenshots
    * diagrams
  * Example CloudFormation templates to construct the necessary monitoring stacks for this system.

## Copyright and License

Copyright 2016 JOHN DRAGO

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
