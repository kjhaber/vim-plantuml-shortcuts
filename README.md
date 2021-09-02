# vim-plantuml-shortcuts

This vim plugin provides a set of vim functions and mappings useful when
working with [PlantUML](https://plantuml.com/) files.  It currently consists of
commands to reverse arrow direction, entity order, or both.  All commands
accept ranges.

## Functions

### :PlantumlToolsReverseEntity
Reverse position of entities in relationship
e.g. `a --> b : comment` becomes `b --> a : comment`

Default mapping: `<leader>ure`

### :PlantumlToolsReverseArrow
Reverse the direction of arrow in relationship
e.g. `a --> b : comment` becomes `a <-- b : comment`

Default mapping: `<leader>ura`

### :PlantumlToolsReverseRelation
Reverse both the entity position and arrow direction
e.g. `a --> b : comment` becomes `b <-- a : comment`

Default mapping: `<leader>urr`

## Installation

Assuming you use vim-plug, Pathogen, or equivalent, add the following to your
.vimrc:

```
Plug 'kjhaber/vim-plantuml-shortcuts'
```

To disable the default mappings, add the following line as well:

```
let g:vim_plantuml_tools_map_keys = 0
```

Reload vim and open a file of type 'plantuml'.

## License
MIT

## Notes

I recommend the following additional plugins for working with PlantUML files in
Vim:

* [aklt/plantuml-syntax](https://github.com/aklt/plantuml-syntax)
* [weirongxu/plantuml-previewer.vim](https://github.com/weirongxu/plantuml-previewer.vim)

