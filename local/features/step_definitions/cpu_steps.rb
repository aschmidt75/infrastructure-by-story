
require 'facter'

Then /^i should be a (.*) machine$/ do |vtype|
                raise "type not matching" unless Facter["virtual"].value == vtype
end

Then /^i should have at least (\d+) cpu(s)?$/ do |v_str,pl|
        f = Facter["processorcount"]
        raise "processorcount fact not found" unless f
        v = v_str.to_i
        n = f.value.to_i
        raise "processorcount is not at least #{v}" unless n >= v
end

