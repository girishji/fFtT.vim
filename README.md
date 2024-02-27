# fFtT.vim

Characters that can be reached with a single jump are highlighted while others
are dimmed. Improves accuracy of `f`, `F`, `t`, `T` navigation within a line.

![](img/fFtT.jpeg)

Highlight group `FfTtSubtle` is associated with characters that are unreachable
within one jump. It is linked to group `Comment`. Configure this if you wish a
different look.

## Requirements

- Vim version 9.0 or higher

## Installation

Install it via [vim-plug](https://github.com/junegunn/vim-plug).

<details><summary><b>Show instructions</b></summary>
<br>
  
Using vim9 script:

```vim
vim9script
plug#begin()
Plug 'girishji/fFtT.vim'
plug#end()
```

Using legacy script:

```vim
call plug#begin()
Plug 'girishji/fFtT.vim'
call plug#end()
```

</details>

Install using Vim's built-in package manager.

<details><summary><b>Show instructions</b></summary>
<br>
  
```bash
$ mkdir -p $HOME/.vim/pack/downloads/opt
$ cd $HOME/.vim/pack/downloads/opt
$ git clone https://github.com/girishji/fFtT.vim.git
```

Add the following line to your $HOME/.vimrc file.

```vim
packadd vimcomplete
```

</details>
