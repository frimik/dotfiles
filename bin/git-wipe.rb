#!/usr/bin/env ruby
#
# Author: Mikael Fridh
#
# Runs all arguments (files) through git filter-branch.
#
# No help output or GetOptions, sorry. You're on your own.

commands = ARGV.collect{|path| "git rm -rf --cached --ignore-unmatch \"#{path}\"" }

filter = commands.join(";")

#command = "git filter-branch --force --prune-empty --index-filter '#{filter}' --tag-name-filter cat -- --all"
command = "git filter-branch --force --index-filter '#{filter}' HEAD"

puts "Running '#{command}'"

system(command)
