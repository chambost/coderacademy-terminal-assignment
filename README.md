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

#### Feature 3. Coloured text

Substituions have distinct colours to enhance readability.

#### Feature 4. Speech-to-text

Speech-to-text will enhance the audio immersion of the experience.

#### Feature 5. Socket communication

Interactions between different terminals via some form of communication such as sockets.

### R9. Trello Board

See [2] in R4 above.