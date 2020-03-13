

require 'pp'
require 'mac/say'
require 'tty-prompt'
require 'erb'
require 'json'

module ClozeApp
    def ClozeApp.load(filename)
        return JSON.parse(File.read(filename))
    end

    def ClozeApp.experience(filename)

        # Message strings
        welcome_message = "Here's how this works. I'm going to ask you for some silly words, nouns, verbs, adjectives, etc. They'll be written down and used to act out a dramatic scene."
        ready_message = "Are you ready for this?"
        perform_message = "Okay, alright, we've filled out the words for our scene. Are you ready for the performance?"
        lets_go_messsage = "Here we go, let's go."

        # Instantiate interactive prompt
        prompt = TTY::Prompt.new

        # Load voices
        begin
            host = Mac::Say.new(voice: :karen, rate:205)
            female = Mac::Say.new(voice: :karen, rate:205)
        rescue Mac::Say::VoiceNotFound
            # Load the default US Female voice if the Australian voice is not available
            host = Mac::Say.new(voice: :samantha, rate:205)
            female = Mac::Say.new(voice: :samantha, rate:205)
        end
        begin
            male = Mac::Say.new(voice: :lee, rate:205)
        rescue Mac::Say::VoiceNotFound
            # Load the default US Male voice if the Australian voice is not available
            male = Mac::Say.new(voice: :alex, rate:205)
        end

        write_and_say = -> msg {
            puts msg
            host.say string: msg
        }

        prompt_ready = -> msg {
            host.say string: msg
            return prompt.yes? msg
        }

        ask = -> msg {
            host.say string: msg
            return prompt.ask msg, required: true
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

        blanks,genders,dialogue = load(filename)

        write_and_say[welcome_message]
        until prompt_ready[ready_message]
        end

        @responses = blanks.map(&ask)

        write_and_say[perform_message]
        until prompt.yes? "?"
        end
        write_and_say[lets_go_messsage] 

        dialogue.each do |d| 
            actor, words = d.split ":"
            # eRuby is used to parse the blanks in the cloze
            voices[genders[actor]].call actor , ERB.new(words).result(binding)
        end
    end
end

