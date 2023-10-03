
# BASIC MENU

This is a basic menu for godot which can be used in two modes, it expects four basic keys for menu interaction to be set (custom_cancel, custom_confirm, custom_left, custom_right).

**NOTE**: If no `cards_container` is set the menu is in Overlay Mode and adds the cards to its own container.
Otherwise the menu is in EmbedMode and uses the the `cards_container` to add the MenuCards.
The OverlayMenu is intended to be either used in Overlay Mode or in Embed Mode, but not mixed.

 - **Embed Mode**:   When `cards_container` is set. Permanently look for input and disable overlay toggle.
 - **Overlay Mode**: When no `cards_container` is set. Look for input, when overlay is toggled.

 ## TODOs
 
  - [ ] pause parent automatically.
  - [ ] default texture for menus.
  - [ ] include keybinding presets (custom_cancel, -confirm, -left, -right).
