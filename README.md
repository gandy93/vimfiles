Readme
=============

## Requirements
This VIm configuration needs for the right functioning things below:

- VIm 7.3+ compiled with Ruby support
- Ruby (Command-T)
- Exuberant Ctags (EasyTags, TagList)
- Git (Fugitive)
- gcc and make (Command-T, VIm)

Exuberant Ctags can be downloaded [here](http://ctags.sourceforge.net/) and
must be placed somewhere in the system path. The VIm source can be found on
[the official web](http://www.vim.org/download.php), [the official mercurial
repository](https://vim.googlecode.com/hg/) or [an unofficial git
repository](https://github.com/b4winckler/vim.git). If you have trouble
compiling it under Windows,
[here](http://cloud.github.com/downloads/codito/vim-config/gvim.win32.7.3.89.zip)
you can find a precompiled gvim binary with Ruby 1.9.2 support. Ruby can be
found [here](http://rubyinstaller.org/downloads/) **The version of the ruby
installation has to be the same as is compiled in VIm.**

If you have only VIm without Ruby, Git or Ctags, almost everything should work anyway 
except EasyTags, TagList, Fugitive and Command-T.

## Installation
### Windows
Open command prompt and get into your home directory. On Vista/7 it's usually:

    cd C:\Users\<your username>\

Then type:

    git clone <repo url> vimfiles
    (wait until cloning's done...)
    cd vimfiles
    git submodule update --init

After that you have to compile Command-T:

    cd bundle/command-t
    rake make

It can fails on Windows. Check path for ruby files and edit Rakefile to make sure
it doesn't call system with '&&'. Then create a file <your home dir>\_vimrc with
this content:

    source <your home dir>\vimfiles\.vimrc

That's all!

### *NIX
The same as above but change every: '\' to '/', 'vimfiles' to '.vim', and '\_vimrc' to '.vimrc'.
