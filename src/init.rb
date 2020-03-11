#!/usr/bin/env ruby

welcome_message = "Here's how this works. I'm going to ask you for some silly words, nouns, verbs, adjectives, etc. They'll be written down and used to act out a dramatic scene."
ready_message = "Are you ready for this?"

require 'pp'
require 'mac/say'
require 'tty-prompt'

prompt = TTY::Prompt.new

host = Mac::Say.new(voice: :karen, rate:225)

write_and_say = -> msg {
    puts msg
    host.say string: msg
}

write_and_say[welcome_message]

answer = false
until answer 
    host.say string: ready_message
    answer = prompt.yes?(ready_message)
end

write_and_say["Silly word"] 
write_and_say["Type of fish"] 
write_and_say["Adjective"] 
write_and_say["What you would shout if you saw a ghost"] 
write_and_say["A number"] 
write_and_say["Another number"] 
write_and_say["A noun"] 
write_and_say["Body part"] 
write_and_say["Another adjective"] 
write_and_say["A type of animal"] 
write_and_say["A curse word you would say in front of a child"] 
write_and_say["Amount of time"] 
write_and_say["Verb ending in i n g"] 
write_and_say["Another body part "] 
write_and_say["Verb"] 
write_and_say["Verb ending in i n g"] 
write_and_say["Adjective"] 
write_and_say["Type of profession"] 
write_and_say["Type of relative"] 
write_and_say["Male name"] 
write_and_say["Made up song title"] 
