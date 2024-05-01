# fFtT.vim

Characters that are reachable with a single jump are highlighted, while others are dimmed. This enhancement enhances the accuracy of navigation using `f`, `F`, `t`, and `T` commands. Moreover, you can prefix the command with a numerical `[count]` (e.g., `3f`), which will exclusively highlight the `[count]`'th occurrence (third in this instance) of a character to the right of the cursor, while dimming the others.

This plugin does not alter Vim operators or commands. It solely focuses on highlighting relevant characters without making any changes to the default key mappings. The code consists of less than 100 lines, with explanatory comments.

![](https://gist.githubusercontent.com/girishji/40e35cd669626212a9691140de4bd6e7/raw/6041405e45072a7fbc4e352cbd461e450a7af90e/fFtT-img.jpeg)

## Requirements

- Vim 9.0 or higher

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

Add the following to your $HOME/.vimrc file.

```vim
packadd fFtT.vim
```

</details>

## Configuration

The appearance of characters that are unreachable within one jump is determined by the highlight group `FfTtSubtle`, which is linked to the `Comment` group by default.

## Other Plugins to Enhance Your Workflow

1. [**devdocs.vim**](https://github.com/girishji/devdocs.vim) - browse documentation from [devdocs.io](https://devdocs.io).

2. [**easyjump.vim**](https://github.com/girishji/easyjump.vim) - makes code navigation a breeze.

3. [**scope.vim**](https://github.com/girishji/scope.vim) - fuzzy find anything.

4. [**autosuggest.vim**](https://github.com/girishji/autosuggest.vim) - live autocompletion for Vim's command line.

5. [**vimcomplete**](https://github.com/girishji/vimcomplete) - enhances autocompletion in Vim.
