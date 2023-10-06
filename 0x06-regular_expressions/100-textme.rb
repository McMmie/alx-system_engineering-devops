#!/usr/bin/env ruby

print ARGV[0].scan(/from:\K.\w+/).join + ","
print ARGV[0].scan(/to:\K.\w+/).join + ","
puts ARGV[0].scan(/flags:\K(\S+)\b/).join
#printf "%s,%s,%s\n", sender, receiver, flags
