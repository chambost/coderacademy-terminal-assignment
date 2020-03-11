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

ask = -> msg {
    host.say string: msg
    return prompt.ask(msg)
}

female_say = -> msg {
    name = "DOCTOR"
    puts "#{name}: #{msg}"
    female.say string: msg
}

male_say = -> msg {
    name = "PATIENT"
    puts "#{name}: #{msg}"
    male.say string: msg
}

write_and_say[welcome_message]

answer = false
until answer 
    host.say string: ready_message
    answer = prompt.yes?(ready_message)
end

response1 = ask["Silly word"] 
response2 = ask["Type of fish"] 
response3 = ask["Adjective"] 
response4 = ask["What you would shout if you saw a ghost"] 
response5 = ask["A number"] 
response6 = ask["Another number"] 
response7 = ask["A noun"] 
response8 = ask["Body part"] 
response9 = ask["Another adjective"] 
response10 = ask["A type of animal"] 
response11 = ask["A curse word you would say in front of a child"] 
response12 = ask["Amount of time"] 
response13 = ask["Verb ending in i n g"] 
response14 = ask["Another body part"] 
response15 = ask["Verb"] 
response16 = ask["Verb ending in i n g"] 
response17 = ask["Adjective"] 
response18 = ask["Type of profession"] 
response19 = ask["Type of relative"] 
response20 = ask["Male name"] 
response21 = ask["Made up song title"]

write_and_say[perform_message]
answer = false
until answer 
    answer = prompt.yes?("?")
end
write_and_say[lets_go_messsage] 

female_say["Well if it isn't my favourite patient Mr. #{response1}"]
male_say["Thanks for seeing me at such short notice Dr. #{response2}. So what's the news?"]
female_say["Well we just finished processing your tests and unfortunately the results are #{response3}"]
male_say["#{response4}"]
female_say["I completely understand that reaction. Your blood pressure is #{response5} over #{response6}"]
female_say["And our x-rays found a #{response7} in your #{response8}"]
female_say["It also appears that you have a rare condition known as #{response9} #{response10}"]
male_say["#{response11}"]
male_say["Is there any way to cure it?"]
female_say["I'm going to write you a prescription for these pills. I want you to take one every #{response12}"]
male_say["But I heard those pills cause involuntary #{response13}"]
female_say["I'm afraid they do. Side effects also include an itchy #{response14} and a decrease in the desire to #{response15}"]
male_say["What can I do to stay healthy?"]
female_say["I would suggest waking up early every morning and doing stretches and then #{response16} in the park"]
male_say["That's great advice especially for a #{response17} #{response18} such as myself"]
female_say["You know the best part about being a doctor is that I get to treat patients like you and then go home to my #{response19} #{response20} and then sing them my favourite song"]
male_say["Which is?"]
female_say["#{response21}"]


