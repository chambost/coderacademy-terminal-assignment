#!/usr/bin/env ruby

welcome_message = "Here's how this works. I'm going to ask you for some silly words, nouns, verbs, adjectives, etc. They'll be written down and used to act out a dramatic scene."
ready_message = "Are you ready for this?"
perform_message = "Okay, alright, we've filled out the words for our scene. Are you ready for the performance?"
lets_go_messsage = "Here we go, let's go."

require 'pp'
require 'mac/say'
require 'tty-prompt'

prompt = TTY::Prompt.new

host = Mac::Say.new(voice: :karen, rate:225)
female = Mac::Say.new(voice: :karen, rate:225)
male = Mac::Say.new(voice: :lee, rate:225)

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
    # name = "DOCTOR"
    puts "#{name}: #{msg}"
    female.say string: msg
}

male_say = -> name, msg {
    # name = "PATIENT"
    puts "#{name}: #{msg}"
    male.say string: msg
}


write_and_say[welcome_message]

until prompt_ready[ready_message]
end

blanks = [ "Silly word" ,
    "Type of fish" ,
    "Adjective" , 
    "What you would shout if you saw a ghost" ,
    "A number" ,
    "Another number" ,
    "A noun" ,
    "Body part" ,
    "Another adjective" ,
    "A type of animal" ,
    "A curse word you would say in front of a child" ,
    "Amount of time" ,
    "Verb ending in i n g" ,
    "Another body part" ,
    "Verb" ,
    "Verb ending in i n g" ,
    "Adjective" ,
    "Type of profession" , 
    "Type of relative" ,
    "Male name" ,
    "Made up song title" ]

@responses = blanks.map(&ask)

write_and_say[perform_message]
until prompt.yes?("?")
end
write_and_say[lets_go_messsage] 

dialogue = [ "DOCTOR: Well if it isn't my favourite patient Mr. <%= @responses[0] %>" ,
"PATIENT: Thanks for seeing me at such short notice Dr. <%= @responses[1] %>. So what's the news?" ,
"DOCTOR: Well we just finished processing your tests and unfortunately the results are <%= @responses[2] %>" ,
"PATIENT: <%= @responses[3] %>" ,
"DOCTOR: I completely understand that reaction. Your blood pressure is <%= @responses[4] %> over <%= @responses[5] %>" ,
"DOCTOR: And our x-rays found a <%= @responses[6] %> in your <%= @responses[7] %>" ,
"DOCTOR: It also appears that you have a rare condition known as <%= @responses[8] %> <%= @responses[9] %>" ,
"PATIENT: <%= @responses[10] %>" ,
"PATIENT: Is there any way to cure it?" ,
"DOCTOR: I'm going to write you a prescription for these pills. I want you to take one every <%= @responses[11] %>" ,
"PATIENT: But I heard those pills cause involuntary <%= @responses[12] %>" ,
"DOCTOR: I'm afraid they do. Side effects also include an itchy <%= @responses[13] %> and a decrease in the desire to <%= @responses[14] %>" ,
"PATIENT: What can I do to stay healthy?" ,
"DOCTOR: I would suggest waking up early every morning and doing stretches and then <%= @responses[15] %> in the park" ,
"PATIENT: That's great advice especially for a <%= @responses[16] %> <%= @responses[17] %> such as myself" ,
"DOCTOR: You know the best part about being a doctor is that I get to treat patients like you and then go home to my <%= @responses[18] %> <%= @responses[19] %> and then sing them my favourite song" ,
"PATIENT: Which is?" ,
"DOCTOR: <%= @responses[20] %>" ]

require 'erb'

actor_to_voice = { 'DOCTOR' => female_say , 'PATIENT' => male_say }
dialogue.each do |d| 
    actor, words = d.split(":") 
    # eRuby is used to parse the blanks in the cloze
    actor_to_voice[actor].call( actor , ERB.new(words).result(binding) ) 
end