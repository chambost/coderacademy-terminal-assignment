# Improv Cloze Drama

This project aims to offer a fill-in-the-blank vocabulary experience.

## R4. Link to source code repository

- [1] https://github.com/chambost/coderacademy-terminal-assignment

- [2] https://trello.com/b/vfvhk4f6/improv-cloze-drama

## Software Development Plan

### R5. Scope 


The terminal application **Improv Cloze Drama** aims to recreate the experience of a social game involving word substitutions. It is specifically inspired by the *Mad Lib Theatre* segment of *The Tonight Show Starring Jimmy Fallon*, which in turn is derived from the *Mad Libs* word gamebooks by *Leonard Stern* and *Roger Price*.

The application is an entertainment product that aims to amuse and engage. The author chose to develop it as an homage to the source material.

The target audience is anyone with an affinity for word and social games in general and for this style of entertainment in particular.

In the sections that follow the game of substituting words to comopose a story will be referred to as a *cloze*.

The application can be used in two to three ways: 
1. to write a cloze for others to experience;
2. to experience a cloze already written;
3. (assumming scope and time allows) to spectate the cloze experience of another player

An author can enter free-form text and indicates sections for substitution and type of substitutions permissable. 

A player:
- chooses a specific cloze or a random one
- for each substitution in the cloze, the player is prompted for the word or phrase of their choosing
- once completed, the drama is performed back for the player with their chosen substituions appearing amongst the full prose of the cloze

A spectator:
- can receive updates to observe as the player makes chooses and hears the result
- (assuming scope and time allows) can indicate their amusement with an applause emote
- (assuming scope and time allows) can participate by voting on choices (this would only be relevant in a multi-player variant, or when a player can indicate multiple substitutions)

### R6. Feature List

#### Feature 1. The word substitution loop

Once a cloze has begun to be played, there is a gameplay loop that is repeated. The player is prompted for a substitution, and she or he supplies the response, then this is repeated for each substitution in the cloze. (This will involve a programming loop as well as possibly error handling)

#### Feature 2. Loading from and saving to a file

A cloze can be saved to the filesystem so that future players can load that experience. (This will involve error handling, also possibly variable scope)

#### Feature 3. Text-to-speech

Text-to-speech will enhance the audio immersion of the experience. Error-handling is important to ensure the system behaves gracefully on systems without text-to-speech or without the specific voices installed.

#### Feature 4. Coloured text

Substituions have distinct colours to enhance readability.

#### Feature 5. Socket communication

Interactions between different terminals via some form of communication such as sockets.

### R7. User Interaction and Experience Outline

Upon entering the application, the user is prompted to choose between two to three modes: create, play and (assuming scope and time allows) spectate. Each mode offers a unique experience.

**CREATE**. In this mode users can enter free-form text interspersed with **Blank**s. The **Cloze** is a drama which can be spoken by two voices, one male and one female. A drama alternates between lines of dialogue spoken by the two voices. The creator is given a choice of the gender of the first voice. They can name the character. Next the line of dialogue is specified, with zero or more **Blank**s interspersed. Moving onto the second character's line of dialogue, a name can be specified, and more dialgoue free-from-text with Blanks can be entereed. The creator then alternates entered dialgoue for each character.

**PLAY**. A player choose to load a specific **Cloze** or opts for a randomised one. The player is welcomed and then prompted (with text-to-speech and onscreen text) to supply a response to each **Blank** in turn. Once all **Blank**s are responded to the player is given the opportunity to listen to the drama that is generated from those responses.

Feature 3, the  

### R9. Trello Board

See [2] in R4 above.

### R10. Installation Steps

To install the Male voice on macOS. 
- Apple > System Preferences … > Accessibility > Speech > System Voice > Customize … 
- Ensure "Lee (English - Australia)" is selected
- Click 'OK' and wait for the download to complete