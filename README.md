infrastructure-by-story
=======================

Infrastructure-by-story is a small, cucumber based example of how to do behaviour driven development for infrastructure-related things.
I relies on facter to collect and check OS data such as networks and the like.

Example
=======

```
Feature: network
        In order to communicate with the backend system
        As a web server node
        I need some networks

Scenario: I need some networks
        Given my hostname is like "web"
        Then i should have a network_eth1 of 192.168.21.0
        And i should have a netmask_eth1 of 255.255.255.0

Scenario: Check that i am real iron
        Given my hostname is like "db"
        Then i should be a physical machine
        And i should have at least 2 cpus
        And i should have at least 8G memory
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
