Feature: Having a functional networking 
	In order to communicate with other components
	As a host
	I need some networks

Scenario: I am connected to networks
	Given my hostname is like rspec
	Then i should be connected to a 192.168.21.0/255.255.255.0 network
	And i should be connected to a 10.0.2.0 network

