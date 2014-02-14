infrastructure-by-story
=======================

Infrastructure-by-story is a small, cucumber based example of how to do behaviour driven development for infrastructure-related things.
It relies on facter to collect and check OS data such as networks and the like.

Example
=======

```
Feature: Running Portal platform
        In order to have a functional Portal platform 
        i need networks and defined servers 
        and communication must be possible

Scenario: Define a web node
        Given my hostname is like "web"
        Then i should be a virtual machine
        And i should have at least 1 cpu with at least 4G memory
        And i should have a network_eth1 of 192.168.21.0
        And i should have a netmask_eth1 of 255.255.255.0

Scenario: Define a database node
        Given my hostname is like "db"
        Then i should be a physical machine
        And i should have at least 2 cpus
        And i should have at least 8G memory
        And i should have a mount /database with at least 250G space
```

Given an abstraction layer, which maps physical information (i.e. 192.168.21.0/24) to logical names (i.e. "backend"),
an extended version of the above could be encoded as

```
Scenario: I need to communicate to my backend services
        Given my hostname is like "web"
        Then i should have a "backend" network
        And i should have a "log" network
```

Todo
====
- [ ] integrate deps via bundler
- [ ] create abstraction layer
- [ ] create remote version with mcollective


The MIT License (MIT)

Copyright (c) 2014 Andreas Schmidt

Permission is hereby granted, free of charge, to any person obtaining a copy of
this software and associated documentation files (the "Software"), to deal in
the Software without restriction, including without limitation the rights to
use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of
the Software, and to permit persons to whom the Software is furnished to do so,
subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS
FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR
COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER
IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
