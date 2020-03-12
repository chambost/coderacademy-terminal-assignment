
require 'tty-prompt'
require 'thor'
require_relative "../modules/cloze_app"

class ClozeCLI < Thor
    desc "random", "Experience a random Cloze"
    def random
        ClozeApp::experience Dir.glob("*.cloze").sample
    end

    desc "choose", "Choose a Cloze to experience"
    option :file, :desc => "Specify a .cloze file to experience"
    def choose 
        if options[:file]
            ClozeApp::experience options[:file] 
        else 
            clozes = Dir.glob "*.cloze" 
            cloze = TTY::Prompt.new.select "Which Cloze do you want to experience?" , clozes + ["Random"] 
            cloze = clozes.sample if cloze == "Random"
            ClozeApp::experience cloze
        end
    end
end