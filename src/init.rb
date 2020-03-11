#!/usr/bin/env ruby

welcome_message = "Here's how this works. I'm going to ask you for some silly words, nouns, verbs, adjectives, etc. They'll be written down and used to act out a dramatic scene. Are you ready for this?"

require 'pp'
require 'mac/say'

host = Mac::Say.new(voice: :karen, rate:225)
puts welcome_message
host.say string: welcome_message