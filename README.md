# Codenames
## Overview
Codenames is a really fun game created by [Czech Games](https://czechgames.com/en/codenames/). 
The two rival spymasters know the secret identities of 25 agents. Their teammates know the agents only by their CODENAMES.

The teams compete to see who can make contact with all of their agents first. Spymasters give one-word clues that can point to multiple words on the board. Their teammates try to guess words of the right color while avoiding those that belong to the opposing team. And everyone wants to avoid the assassin.

Codenames: win or lose, it’s fun to figure out the clues.

### Configuration
1. rails db:create
2. rails db:migrate
3. rails d
If you are playing on one computer and using localhost no configuration needed. If you want to open up your computer as a server (using Ngrok for example). Then you need to go to ./src/constants/index.js and change API_ROOT to the http of the host address and API_WS_ROOT to the ws of the host address (ws://*HOST_ADDRESS*/cable).

