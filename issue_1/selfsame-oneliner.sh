#  Fifteen years ago I installed linux for the first time.  I had bought a Toshiba Protegé laptop - a 
#  wonderful clunky antique - and installed slackware with 20 some floppy disks. It took around 7 hours.
#  ls & dir were the only commands I knew.  I spent hours wandering around the directory tree, exploring 
#  dark chambers full of files - the purpose of which I could only guess. 

#  Linux was lonely.

#  Ten years ago I installed ubuntu on one of those bright mac bubble computers.  Everything mainly worked,
#  but if it didn't you could search the ubuntu forums.  You had to write your questions in the correct way
#  if you wanted an answer. You could tell how good of a linux user someone was by the amount of little coffee
#  bean icons in their forum bio.

#  Linux was confusing.

#  A year and a half ago I joined a tilde - a social club inside a linux box. IRC was full of friendly strangers
#  who love to answer questions. Everyone was starting and collaborating on strange projects. I learned how to do
#  things with the command line.

#  Linux was a town.

#  Anyhoo.. Today I'm going to share a bash script that I find pretty useful. For this to work
#  you'll need a ~/bin directory in your path. You can automate this for every session by adding
#  this to your ~/.profile file:

PATH="$HOME/bin:$PATH"

#  Now, enter the following command in your terminal

echo 'echo $2 > ~/bin/$1 && chmod +rx ~/bin/$1' > ~/bin/defn && chmod +rx ~/bin/defn

#  This places an executable script in your path that places executable scripts in your path.
#  Now whenever you do something neat on the command line, you can save a new command for it:

defn note 'echo $1 >> ~/notes.txt'

#  selfsame@tilde>note "remember to write something for the tilde town zine"

#  And just to be clever you can now run

defn defn 'echo $2 > ~/bin/$1 && chmod +rx ~/bin/$1'

#  (This is probably an example of `bootstrapping` - a computer term that references an old saying about 
#  lifting onself by pulling on your own bootstraps)

#  Well that's that - I can be written to at ~selfsame and love getting letters when I log in, ciao!