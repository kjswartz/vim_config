# Initial VIM/MVIM Setup
This is just a basic introduction to help you get VIM and MACVIM setup and a few settings configured. You can clone down and copy the .vimrc, .gvimrc, and plugins.vim files as is and 
below I will walkthrough were they go as well as cover what the various settings relate to.

This walkthough utilizes Homebrew to install a few dependcies. First you need to get vim and macvim installed.
```
$ brew install vim && brew install macvim
```

After installing run the below code in terminal. This will sym link macvim to your Applications directory.
```
$ brew link macvim
```

Now within terminal to open files and directories just use the below command.
```
$ mvim or mvim .
``` 

## Introduction to VIM
Run the below in a terminal window in order to run through the VIM crash course. This is a great place to start to learn the basic navigation of vim. 
They (the people on the internet) claim you can run through this tutorial in 30 minutes. It took me a little longer because I ran through the lessons a couple of times each
in order to better understand and remember them. NOTE: Eneter either `:bd`, `:q` or `ZZ` to exit current vim buffer or session. `:bd` is short for buffer drop, `:q` is quit, and `ZZ` is same as `:wq` write and quit. 
```
$ vimtutor
``` 

VIM has several different [MODES](https://en.wikibooks.org/wiki/Learning_the_vi_Editor/Vim/Modes) it operates in i.e. NORMAL, VISUAL, INSERT. 
NOTE: If you ever enter a mode you are unfamiliar with, or are not sure which mode you are in, you can usually press ESC to get back to normal mode.


| Name	| Description	| help page |
| ----- | ----------- | --------- |
| normal | For navigation and manipulation of text. This is the mode that vim will usually start in, which you can usually get back to with ESC. | :help Normal-mode
| insert | For inserting new text. The main difference from vi is that many important "normal" commands are also available in insert mode - provided you have a keyboard with enough meta keys (such as Ctrl, Alt, Windows-key, etc.).| :help Insert-mode
| visual | For navigation and manipulation of text selections, this mode allows you to perform most normal commands, and a few extra commands, on selected text. | :help Visual-mode
| select | Similar to visual, but with a more MS Windows-like behavior. | :help Select-mode
| command-line | For entering editor commands - like the help commands in the 3rd column. | :help Command-line-mode
| Ex-mode | Similar to the command-line mode but optimized for batch processing. | :help Ex-mode

## Setting Up Initial Directory Structure
### .vimrc File
If a .vimrc file did not get created during the installation process then just create it yourself. Keep this in you main root directory. 
This file is where you will set all of your vim and macvim options. Why do I need macvim and vim? Macvim offers several GUI conveniencies over vim, such as mouse select and you can copy, paste and cut
using the keyboard shortcuts you are used to (cmd-v, x, c).
```
$ touch ~/.vimrc
```
Add the following to this file in order to enable syntax highlighting and to have the backspace perform like every other editors. NOTE the double quote (") is how to mark a comment in vim.
> set nocompatible                  "We want the latest Vim settings/options
> 
> syntax enable			"enable syntax highlighting
>
> set backspace=indent,eol,start      "Make backspace behave like every other editor

Adding the below code to your .vimrc file will allow you to source your .vimrc file whenever you save it: `:w`.

> "---------------Auto-Commands--------------"
>
> "Automatically source Vimrc file on save.
>
> augroup autosourcing
>
> autocmd!  
>
> autocmd BufWritePost .vimrc source %
>
> augroup END

### .vim Directory
Create a .vim directory in your root directory. This is where you wil store all of you vim associated files and configurations i.e. colors, bundles, plugins. 
```
$ mkdir ~/.vim
```

#### Mappings (shorcuts)
You will be editting your .vimrc file a lot and it can be a pain typing `vim ~/.vimrc` all of the time to open the file, or `:e ~/.vimrc` from within vim or mvim.

Enter Mappings! You can set map shortcuts in your .vimrc file just like `alias` within bash_profile. We set mapping with `nmap`. `<Leader>` is default mapped to `\`. 
You can change the key it is mapped to if you'd like but I leave it as is. 
> "Make it easy to edit vimrc file.
>
> nmap \<Leader\>ev :tabedit $MYVIMRC\<cr\>

This will alow us to type `\ev` from within vim or mvim in order to bring up our .vimrc file. You can also map shortcuts to `CMD` or `CTRL` key as well. 

## Making VIM Pretty

### Updating Color Scheme 
To change the color scheme add the colorscheme option to your .vimrc file. In order to see the default colorschemes shipped with vim type `:colorscheme` then `Space` 
followed by `TAB`. This will cycle through the available color schemes. 
```
colorscheme blue
```

The default available schemes are ok but not great. Luckily we can easily import new ones from the internet. Just search vim color schemes. I like using [onedark](https://github.com/joshdick/onedark.vim) atom theme.

First create a colors directory in your .vim directory.
```
$ mkdir ~/.vim/colors
```

Then download the color scheme you want to use and move it to the colors directory you just created. NOTE: You only need to theme.vim file. I just wget on the [RAW](https://raw.githubusercontent.com/joshdick/onedark.vim/master/colors/onedark.vim) 
file on github of the .vim color scheme I want. You can also download and move it manually. As long as ou place the theme.vim file in the colors directory you're good to go. 
```
.vim/colors$ wget https://raw.githubusercontent.com/joshdick/onedark.vim/master/colors/onedark.vim
```  

Then all you have to do is update the `colorscheme` option in your .vimrc file. I also set the terminal to use 256 colors. 
> colorscheme onedark
>
> set t_CO=256 "Sets terminal colorscheme to use 256 colors

### Visuals
Below are some visual options you can setup in your .vimrc file. To read more about these options while in vim type `:help <option_name>` to bring up the gui options documentation. 
> set linespace=15						"Line spacing
>
> set tabstop=2               "Soft tabs, 2 spaces
> 
> set shiftwidth=2            "Shift to 2
> 
> set softtabstop=2           "Sets the number of columns for a TAB 

## Plugins
Plugins are used in order to add additional functionality to vim or mvim. They are like gems or coco pods, or node packages. 

### [Vundle](https://github.com/VundleVim/Vundle.vim)
Vundle is short for Vim bundle and is a Vim plugin manager. We'll use this in order to install our plugins.

First we need to setup a bundle directory to store our plugins. 
```
$ mkdir ~/.vim/bundle
```
Next clone Vundle to your new bundle directory.
```
$ git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
``` 
Now we will setup our `plugins.vim` file.
```
$ touch ~/.vim/plugins.vim
```
Add the below block to this file. All of your Plugins are installed by placing them inbetween the calls to begin and end vundle. `Plugin 'plugin_name'`
> " set the runtime path to include Vundle and initialize
>
> set rtp+=~/.vim/bundle/Vundle.vim
>
> call vundle#begin()
> 
> " let Vundle manage Vundle, required
>
> Plugin 'VundleVim/Vundle.vim'
>
> " All of your Plugins must be added before the following line
>
> call vundle#end()            " required
>
> filetype plugin indent on    " required


Finally we have to import the `plugins.vim` file into our `.vimrc` file. So we can run the install on our PLugins.
> so ~/.vim/plugins.vim


### NERDTree
NOTE `-` removes an option and `+` adds it. When we set `guioptions` these are only taking effect in mvim as mvim is our GUI vim editor. The `guioptions` we our setting here are for mvim splits and scroll bars. You can read more about them
in the help manual `:help guioptions`. 

> set guifont=Menlo:h14				"Set font and size 
>
> set guioptions-=e           "we dont want gui tabs
> 
> set guioptions-=l           "Scroll bar visual options.
> 
> set guioptions-=L
> 
> set guioptions-=r
> 
> set guioptions-=R
  
 
## Reference Links
* [VIM Cheat Sheet](https://vim.rtorr.com/)
* [MACVIM](http://macvim-dev.github.io/macvim/)
