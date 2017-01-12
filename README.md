# Initial VIM/MVIM Setup
This is just a basic introduction to help you get VIM and MACVIM setup and a few settings configured. You can clone down and copy the .vimrc, .gvimrc, and plugins.vim files as is and 
below I will walkthrough were they go as well as cover what the various settings relate to. This will NOT make you an expert in vim/mvim. This is just to help get your initial environment 
set up with some configurations to help mirror editors like Atom or Sublime. Why not just use Atom or Sublime if you are going to setup mvim to operate like them anyways? Because vom/mvim 
offers a lot of control over configurations and shortcuts which can greatly improve productivity.

This walk through utilizes Homebrew to install a few dependencies. First you need to get vim and macvim installed.
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
in order to better understand and remember them. NOTE: Enter either `:bd`, `:q` or `ZZ` to exit current vim buffer or session. `:bd` is short for buffer drop, `:q` is quit, and `ZZ` is same as `:wq` write and quit. 
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

This will allow us to type `\ev` from within vim or mvim in order to bring up our .vimrc file. You can also map shortcuts to `CMD` or `CTRL` key as well. 

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
Plugins are used in order to add additional functionality to vim or mvim. They are like gems, coco pods, or node packages. 

### [Vundle](https://github.com/VundleVim/Vundle.vim): Plugin manager
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


Finally we have to import the `plugins.vim` file into our `.vimrc` file. So we can run the install on our Plugins.
> so ~/.vim/plugins.vim

Now when we add a new Plugin to our PLugins.vim file we save it and then in our .vimrc file we can `:w` and then `:PluginInstall` 

### [Vinegar](https://github.com/tpope/vim-vinegar): Directory browsing
[Netrw](http://www.vim.org/scripts/script.php?script_id=1075) is vim's built in directory browser. Vinegar.vim enhances netrw, partially in an attempt to mitigate the need for more disruptive "project drawer" style plugins.
In order to add this `Plugin` we'll open our `plugins.vim` file and add it between the vundle calls.
```
$ vim ~/.vim/plugins.vim
```
> Plugin 'tpope/vim-vinegar' 

Within plugins.vim `:w` to save. Then `<Leader>ev` (since we set up a shortcut to our .vimrc file earlier) to open our `.vimrc` file and we'll want to source this file `:w` and then install the plugins `:PluginInstall`. 

Now we can hit the minus key `-` when we our in normal mode within vim to open up our current directory and navigate around. Use `I (Shift-i)` in order to bring up a help menu for a few basic options. Pretty neat but what
if you are digging through directories and want to go back? Just use `<C-o>` in order to step back through your journey and `<C-i>` to go forward. NOTE `<C->` is the control key, `<D->` is the command key. You'll see these a lot
for keyboard mappings.

If at any point in browsing your directories you want to stop and go back to the file you original had open you can either `<C-o>` until the screen goes back to the point where it is available, or you can
simply type `:bd` for buffer drop. NOTE: `<C-o>` and `<C-i>` can be used throughout vim in order to move back and forth through edit points. Play around and you'll see or google to learn more.   

### [NERDTree](https://github.com/scrooloose/nerdtree): Sidebar directory tree
Vinegar is pretty neat and makes browsing through your directories and files easier, but we can make our Macvim even better with sidebar directory layout we are used to with most editors like Sublime, Atom, or Xcode.
NERDtree allows you to explore your filesystem and to open files and directories. It presents the filesystem to you in the form of a tree which you manipulate with the keyboard and/or mouse. It also allows you to perform simple filesystem operations.

Just like with Vinegar we need to add the plugin to our `plugins.vim` file, source `.vimrc` by going to it and saving `:w`, and then `:PluginInstall` within .vimrc.
> Plugin 'scrooloose/nerdtree' 

Adding the below options to our `.vimrc` will setup a keyboard shortcut for toggling NERDTree on and off and will make sure NERDTree behaves like NERDTree and not Vinegar. Here we are mapping the toggle to 
work when you press command and then 1 (from within normal mode).  
> let NERDTreeHijackNetrw = 0
> 
> "Make nerd tree toggle easier.
> 
> nmap \<D-1> :NERDTreeToggle<cr>

While browsing through NERDTree sidebar we can open files a number of different ways. Use `? (shift-/)` in order to bring up a quick help menu with key mappings. You can close this menu by pressing `?`
again. We'll be able to open files a few different ways, two of the main ones being in splits and tabs. While your cursor is on a file use `s` to open in a verticle split and `t` to open in a tab.

Lets configure some options in our `.vimrc` file for NERDTree. Here we our setting our defaults for verticle and horizontal splits to be to the right and below. We are also mapping some short cuts
for navigating between splits. Just like how we use `H J K L` for cursor navigation in vim, we just prepend those with the control key in order to navigate across splits. 
So now `<C-J>` will move down through splits, `<C-K>` will move up and `<C-H>` and `<C-L>` for left and right navigation. We can close a split in macvim with `<D-w> (cmd-w)`, `:bd`, or `:w` 
while in the split we want to close. To get even fancier we can type `:ls` to get a list of our buffers and then `:bd XX` the id of the buffer we want to close.  

> "------------Split Management-------------"
> 
> set splitright            "And to the right. This feels more natural
> 
> set splitbelow            "Make splits default to below...
> 
> "We'll set simpler mappings to switch between splits.
> 
> nmap \<C-J> \<C-W>\<C-J>
> 
> nmap \<C-K> \<C-W>\<C-K>
> 
> nmap \<C-H> \<C-W>\<C-H>
> 
> nmap \<C-L> \<C-W>\<C-L>

 Below we will configure some tabs and splits styling. You can play around with these until you find something you like.
NOTE `-` removes an option and `+` adds it. When we set `guioptions` these are only taking effect in mvim as mvim is our GUI vim editor. The `guioptions` we our setting here are for mvim splits and scroll bars. You can read more about them
in the help manual `:help guioptions`. Essentially we are removing the scroll bar from being visible on the side all the time and we are removing the tabs bar on the top.

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
  
Below are some additional NERDTree visual options you can configure. I ended up setting a highlight for my verticle split windows and tab headers.

> "highlight verticle split with a white bar
>
> hi vertsplit guifg=white guibg=white
>
> "Highlight active tab with green color
>
> hi TabLineSel guifg=LightGreen guibg=DarkGreen
>
> "Highlight nonactive tab with red background
>
> hi TabLine guifg=LightRed guibg=DarkRed 

### Basic Searching
We can search through the current file we have open by typing `/` while in normal mode, and you'll see the slash populate at the bottom. Then just start typing and hit `Enter` to 
go to the first occurance found in the file. You should see your cursor placed on the occurance, then just use `n` to cycle forward (down) or `N (shift-n)` backward (up) through the matches.

Add the below to your `.vimrc` file for setting a few basic searching options.
> set hlsearch                "Highlight all matched terms.
>
> set incsearch               "Incrementally highlight, as we type. 

In order to remove the highlighting we can setup a mapping to avoid having to type `:nohlsearch` after we are finished. Now if we type `\<spacebar>` (my Leader key is mapped to \\) in normal mode, it is the equivalent `:nohlsearch` and hitting `Enter`. 
`<cr>` stands for carriage return, the `Enter` key. Mappings are really awesome and add to the productivity of working in vim.    
> "Add highlight removal.
> 
> nmap <Leader><space> :nohlsearch<cr>

### Advanced Searching
Searching through files not open in vim, in a grep like manner (think cmd-shft-f in atom) is a bit of a process. 
We're going to have to install a few different plugins to get everything setup and configured to work somewhat how we are used to search working. Having to install and configure all of these 
different plugins can be a bit of an inconvenience and is likely why more people don't use vim, but the control over configuration is also one of vim's greatest strengths.

 Before we add the additional searching plugins, lets setup a `.gvimrc` file, if one doesn't exist, for disabling certian macmenu shortcut keys. 
```
$ touch ~/.gvimrc 
```
Adding the below code to this file will disable the `<D-p> (cmd-p)` and `<D-f> (cmd-f)` shortcut keys in macvim by setting them to no operation. This way when we setup are advance search plugins we can map `<D-p>` and `<D-f>` in our
.vimrc file to shortcuts to use the new plugins in macvim without triggering a print action or bring up the native find and replace. We do not need a native fine and replace since we can use `/` to search our current file.
Replace can be done through these new plugins. Is this a pain, at first yes but once you get the hang of it, it's not so bad. 
> "Disable Print and find 
>
> if has("gui_macvim")
>
>   macmenu &File.Print key=\<nop>
>
>   macmenu Edit.Find.Find\\.\\.\\. key=\<nop>
>
> endif

We are going to be adding three plugins to setup our search functionality in vim/mvim.
So once again open your `plugins.vim` file and insert the following plugins, save (source) your `.vimrc` file and `:PluginInstall`:
> Plugin 'ctrlpvim/ctrlp.vim'
>
> Plugin 'mileszs/ack.vim'
>
> Plugin 'skwp/greplace.vim'

#### [ctrlp](https://github.com/ctrlpvim/ctrlp.vim)
CtrlP is a full path fuzzy file, buffer, mru, tag, ... finder for Vim. This plugin so we can search through our directories for files and bring up recently opened files. 


> let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git\|dist'

> let g:ctrlp_match_window = 'top,order:ttb,min:1,max:20,results:20'

  

> nmap <D-p> :CtrlP<cr>

> nmap <D-r> :CtrlPBufTag<cr>

> nmap <D-e> :CtrlPMRUFiles<cr>


#### [greplace](https://github.com/skwp/greplace.vim)
VIM Plugin for doing a search and replace across many files.

#### [ack](https://github.com/mileszs/ack.vim)
Run your favorite search tool from Vim, with an enhanced results list. We are basically using `ack` as a wrapper for `greplace`.





### [SnipMate](https://github.com/garbas/vim-snipmate)





## Reference Links
* [VIM Cheat Sheet](https://vim.rtorr.com/)
* [MACVIM](http://macvim-dev.github.io/macvim/)
