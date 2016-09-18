# vim-auto-save
Lightweight auto-saving functionality for vim

- `b:auto_save` - Determines whether auto saving is on for that buffer. Switch
  with `:AutoSaveToggle`. Set to on by default
- `b:autosavetick` - Set to value of `b:changedtick` after every save.
