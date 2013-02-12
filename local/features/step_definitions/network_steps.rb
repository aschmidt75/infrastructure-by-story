
require 'facter'

Given /^my hostname is like (.*)$/ do |hn|
  raise "My hostname is not like #{hn}" unless Facter["fqdn"].value =~ /#{hn}/
end

Then /^i should be connected to a (\d+)\.(\d+)\.(\d+)\.(\d+)\/(\d+)\.(\d+)\.(\d+)\.(\d+) network$/ do |ip1,ip2,ip3,ip4,nm1,nm2,nm3,nm4|
	ip = "#{ip1}.#{ip2}.#{ip3}.#{ip4}"
	nm = "#{nm1}.#{nm2}.#{nm3}.#{nm4}"

	# iterate all networks and netmasks from facter
	b_matches = false
	intfs = Facter["interfaces"].value || ""
	intfs.split(",").each do |intf|
		b_matches = true if ip == Facter["network_#{intf}"].value && nm == Facter["netmask_#{intf}"].value
		
	end
	raise "No matching network found" unless b_matches
end

Then /^i should be connected to a (\d+)\.(\d+)\.(\d+)\.(\d+) network$/ do |ip1,ip2,ip3,ip4|
        ip = "#{ip1}.#{ip2}.#{ip3}.#{ip4}"

        # iterate all networks and netmasks from facter
        b_matches = false
        intfs = Facter["interfaces"].value || ""
        intfs.split(",").each do |intf|
                b_matches = true if ip == Facter["network_#{intf}"].value
        end
        raise "No matching network found" unless b_matches
end


