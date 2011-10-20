Description
===========

Installs and configures the Haibu application server.

Requirements
============

The following cookbooks are dependencies:

* npm
* nodejs
* git

Attributes
==========

* `node["haibu"]["port"]` - The network port used by Haibu API Server, default `9002`.

Usage
=====

Simply include the recipe where you want Haibu installed.

License and Author
==================

Author:: Romain PHILIBERT (<filirom1@gmail.com>)

Copyright: Filirom1

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
