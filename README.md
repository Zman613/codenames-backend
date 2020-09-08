# Codenames
## Overview
Codenames is a really fun game created by [Czech Games](https://czechgames.com/en/codenames/). 
The two rival spymasters know the secret identities of 25 agents. Their teammates know the agents only by their CODENAMES.

The teams compete to see who can make contact with all of their agents first. Spymasters give one-word clues that can point to multiple words on the board. Their teammates try to guess words of the right color while avoiding those that belong to the opposing team. And everyone wants to avoid the assassin.

Codenames: win or lose, it’s fun to figure out the clues.

### Configuration
Create, migrate and seed the database with rails db:setup.
If you are playing on one computer and using localhost no configuration needed. If you want to open up your computer as a server (using Ngrok for example). Then you need to go to .config/environments/development.rb and comment out config.action_cable.allowed_request_origins = ['Your Host Name'] 
