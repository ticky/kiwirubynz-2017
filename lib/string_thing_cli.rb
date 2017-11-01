#!/usr/bin/env ruby

require_relative 'string_thing'

class StringThingCLI
  def main
    STDOUT.puts StringThing.new.parse(STDIN.read)
  end
end
