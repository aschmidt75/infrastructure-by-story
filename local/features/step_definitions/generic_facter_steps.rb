
require 'facter'

Given /^my hostname is like (.*)$/ do |hn|
  raise "My hostname is not like #{hn}" unless Facter["fqdn"].value =~ /#{hn}/
end

Then /^i should have a (.*) of (.*)$/ do |fact, value|
                raise "No fact #{fact} with value #{value} found" unless Facter[fact].value == value
end

Then /^my (.*) should match (.*)$/ do |fact, value|
                raise "Fact #{fact} not found" unless Facter[fact]
                r = Regexp.new value
                raise "No fact #{fact} with value #{value} found" unless Facter[fact].value.match r
end

Then /^my (.*) should be (.*)$/ do |fact, value|
                raise "Fact #{fact} not found" unless Facter[fact]
                raise "No fact #{fact} with value #{value} found" unless Facter[fact].value == value
end


