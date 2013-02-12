infrastructure-by-story
=======================

Infrastructure-by-story is a small, cucumber based example of how to do behaviour driven development for it infrastructure.

Example
=======

```
Feature: network
        In order to communicate with other components
        As a host
        I need some networks

Scenario: I need some networks
        Given my hostname is like web
        Then i should have a network_eth1 of 192.168.21.0
        And i should have a netmask_eth1 of 255.255.255.0

Scenario: Check that i am real
        Then i should be a physical machine
        And i should have at least 1 cpu
```

Todo
====

