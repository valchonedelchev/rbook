#!/usr/bin/env ruby
$:.unshift(File.dirname(__FILE__) + '/../lib');
require 'rbook'
Phonebook.new.action?
