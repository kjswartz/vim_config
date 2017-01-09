# Initial VIM/MVIM Setup
This is just a basic VIM and MACVIM initial setup. This walkthough utilizes Homebrew to install a few dependcies. First you need to get vim and macvim installed.
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
Run the below in a terminal window in order to run through the VIM crash course. 
```
$ vimtutor
``` 

This is a great place to start to learn the basic navigation of vim. 
They (the people on the internet) claim you can run through this tutorial in 30 minutes. It took me a little longer because I ran through the lessons a couple of times each
in order to better understand and remember them.

## Setting Up Initial Directory Structure
### .vimrc File
If a .vimrc file did not get created during the installation process then just create it yourself. Keep this in you main root directory. 
This file is where you will set all of your vim and macvim options. Why do I need macvim and vim? Macvim offers several GUI conveniencies over vim, such as mouse select and you can copy, paste and cut
using the keyboard shortcuts you are used to (cmd-v, x, c).
```
$ touch ~/.vimrc
```
Add the following to this file. NOTE the double quote (") is how to mark a comment in vim.

> syntax enable			"enable syntax highlighting
>
> set backspace=indent,eol,start      "Make backspace behave like everyother editor

Also add the below code to your .vimrc file. This will source your .vimrc file whenever you save `:w`

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




#### Mappings (shorcuts)
You will be editting your .vimrc file a lot and it can be a pain typing `vim ~/.vimrc` all of the time to open the file, or `:e ~/.vimrc` from within vim or mvim.

Enter Mappings! You can set map shortcuts in your .vimrc file just like alias within bash_profile. We set mapping with `nmap`. `<Leader>` is default mapped to `\`. 
You can change the key it is mapped to if you'd like but I leave it as is. 
> "Make it easy to edit vimrc file.
>
> nmap \<Leader\>ev :tabedit $MYVIMRC\<cr\>

This will alow us to type `\ev` from within vim or mvim in order to bring up our .vimrc file. 
 


### .vim Directory
Create a .vim directory in your root directory. This is where you wil store all of you vim associated files and configurations i.e. colors, bundles, plugins. 
```
$ mkdir ~/.vim
```

## Making VIM Pretty

### Updating Color Scheme 
To change the color scheme add the colorscheme option to your .vimrc file. In order to see the default colorschemes shipped with vim type `:colorscheme` then `Space` 
followed by `TAB`. This will cycle through the available color schemes. 
```
colorscheme blue
```

The default available schemes are ok but not great. Luckily we can easily import new ones from the internet. I like using [onedark](https://github.com/joshdick/onedark.vim) atom theme.

First create a colors directory in your .vim directory.
```
$ mkdir ~/.vim/colors
```

Then download the color scheme you want to use and move it to the colors directory you just created. Personally I just pull up the [RAW](https://raw.githubusercontent.com/joshdick/onedark.vim/master/colors/onedark.vim) 
file on github of the .vim color scheme I want and then perform a wget on it in my colors directory. You can also download it manually. As long as ou place the XXXX.vim file in the colors directory you're good to go. 
```
.vim/colors$ wget https://raw.githubusercontent.com/joshdick/onedark.vim/master/colors/onedark.vim
```  

Then all you have to do is update your .vimrc file 
> colorscheme onedark
>
> set t_CO=256 "Sets terminal colorscheme to use 256 colors

### Visuals
Below are some visual options you can setup in your .vimrc file. To read more about these options while in vim type `:help guioptions` to bring up the gui options documentation. NOTE `-` removes an option and 
`+` adds it. NOTE when we set `guioptions` this is only taking effect in mvim as mvim is our gui vim editor. The `guioptions` we our setting here are for mvim splits and scroll bars. You can read more about them
in the help manual. 
>
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
> 
> set linespace=15						"Line spacing
>
> set tabstop=2               "Soft tabs, 2 spaces
> 
> set shiftwidth=2            "Shift to 2
> 
> set softtabstop=2           "Sets the number of columns for a TAB 
  
 
## Reference Links
* [VIM Cheat Sheet](https://vim.rtorr.com/)
* [MACVIM](http://macvim-dev.github.io/macvim/)
