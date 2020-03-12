#!/usr/bin/env ruby

welcome_message = "Here's how this works. I'm going to ask you for some silly words, nouns, verbs, adjectives, etc. They'll be written down and used to act out a dramatic scene."
ready_message = "Are you ready for this?"
perform_message = "Okay, alright, we've filled out the words for our scene. Are you ready for the performance?"
lets_go_messsage = "Here we go, let's go."

require 'pp'
require 'mac/say'
require 'tty-prompt'
require 'erb'
require 'json'


prompt = TTY::Prompt.new

host = Mac::Say.new(voice: :karen, rate:215)
female = Mac::Say.new(voice: :karen, rate:215)
male = Mac::Say.new(voice: :lee, rate:215)

write_and_say = -> msg {
    puts msg
    host.say string: msg
}

prompt_ready = -> msg {
    host.say string: msg
    return prompt.yes?(msg)
}

ask = -> msg {
    host.say string: msg
    return prompt.ask(msg, required: true)
}

female_say = -> name, msg {
    puts "#{name}:#{msg}"
    female.say string: msg
}

male_say = -> name, msg {
    puts "#{name}:#{msg}"
    male.say string: msg
}

voices = { 'female' => female_say , 'male' => male_say }


cloze = File.read('washington.json')
blanks,genders,dialogue = JSON.parse(cloze)


write_and_say[welcome_message]
until prompt_ready[ready_message]
end

@responses = blanks.map(&ask)

write_and_say[perform_message]
until prompt.yes?("?")
end
write_and_say[lets_go_messsage] 

dialogue.each do |d| 
    actor, words = d.split(":") 
    # eRuby is used to parse the blanks in the cloze
    voices[genders[actor]].call( actor , ERB.new(words).result(binding) ) 
end