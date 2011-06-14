Rucket
======
Rucket is a simple factoid IRC bot based on Isaac

Running
=======

     bundle install

     ruby rucket.rb


With another irc client (rucket doesn't report messages recieved), connect to #bots on irc.freenode.net. You can change the server, port, channels, etc. in rucket.rb


Using
=====
Join the same channel as rucket. In normal conversation, when bucket sees something that matches one of its factoids, it responds with a random factoid from the list. You can see its full database in matches.json. To add to the database, say in a channel its listening on: ^key:value", where key is the phrase to match, and value is the phrase to say upon a match.
