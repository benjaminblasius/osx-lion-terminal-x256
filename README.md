# Terminal theme & .bash_profile script that depends on osx lion's terminal.app 256 colors feature

## Make sure you back up your local .profile, .bash_profile files

1. .bash_profile shell script adds prompt functionality for rvm and git
2. makes it super easy to color your prompt how you want
3. adds git and bash completion shell via tabbing
4. add bookmark functionality so you can easily cd to your bookmarks
5. very straight forward and easy to make your own

## How do I install it?

1. clone this project via git
2. back up your local .profile, .bash_profile files!

	- cp ~/.profile ~/.profile_backup
	- cp ~/.bash_profile ~/.bash_profile_old

3. cd via terminal to the directory you cloned the project 

	- cd osx-lion-terminal-x256
	- cp bash_completion /etc/
	- mkdir -pv ~/src/git
	- cp git-completion.bash ~/src/git/
	- cp bash_profile ~/.bash_profile

4. double click on the osx-lion-terminal-x256.terminal file

	- configure colors how you want, under terminal/preferences/settings
	- set the profile as the default 


## If you don't like the prompt, colors, settings...

- vi ~/.bash_profile
- read the comments in the file and customize to your liking