# searcher scripts
search recursively in the text and binary files

## fflag.sh 
### usage <br>
```bash
./fflag.sh DIR PATTERN
```
this script searches over DIR and all of its text and binary files to find the PATTERN. the script uses extended regex for pattern matching and it is **case insensitive**
### exmaples:<br>
* `fflag . test` searches for "test" at the current directory and all of its files.
* `fflag ~ ^bash` searches for a line statring with the "bash" over home and all of its subfiles.


## web.sh
### before using
this script downloads an url files(images,scripts,htmls etc.) and do a search over them using fflag.sh script. if you want to use it, you should 
place (or better hard link) fflag.sh somewhere that $PATH can find it.
for example `/bin`. note that the script also needs execution permission which you can give it by running `chmod +x fflag.sh`

**note that this script do not remove downloaded files and you have to do it manually.**
## usage <br>
```bash
./web.sh URL PATTERN
```

## awesome-touchpad-fixer.sh
fixing awesomewm touchpad issues
### befor using
install the xinput by your favourite package manager

### usage <br>
add the script to your login file. for example if using x, put the following line at the bottom of your `~/.xinitrc`
```bash
source <path to awesome-touchpad-fixer>
```

## Recommendations
if you want to access an script from everywhere just by tying its name, you can hard link(or copy) it somewhere that $PATH point to. for example /bin or /usr/bin.
(if you want to hard link the script to /bin, you can tun this command `sudo ln script_path /bin/command_name`)
after that you have to give it the execution permission by running chmod +x srcipt_name.sh and now you can use it anywhere just by typing its name.
