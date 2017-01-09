# Initial VIM/MVIM Setup
This is just a basic VIM and MACVIM initial setup. This walkthough utilizes Homebrew to install a few dependcies. First you need to get vim and macvim installed.

```
brew install vim && brew install macvim
```

After installing run the below code. This will sym link macvim to your Applications directory so you can run 
```
mvim
``` 
in terminal to open files and directories.

```
brew link macvim
```

## Introduction to VIM
run 
```
vimtutor
``` 
in a terminal window in order to run through the VIM crash course. 

This is a great place to start to learn the basic navigation of vim. 
They (the people on the internet) claim you can run through this tutorial in 30 minutes. It took me a little longer because I ran through the lessons a couple of times each
in order to better understand and remember them.

## Setting Up .vimrc 
If a .vimrc file did not get created during the installation process then just create it yourself. Keep this in you main root directory. This file is where you will 
set all of your vim and macvim options.

```
touch ~/.vimrc
```

Add the following to this file. NOTE the double quote (") is how to mark a comment in vim.

> syntax enable			"enable syntax highlighting
>
> set backspace=indent,eol,start      "Make backspace behave like everyother editor


## Mappings and Commands



## Reference Links
* [VIM Cheat Sheet](https://vim.rtorr.com/)
* [MACVIM](http://macvim-dev.github.io/macvim/)
