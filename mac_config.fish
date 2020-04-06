eval (python -m virtualfish compat_aliases)
export LANG=en_US.UTF-8
set -g theme_nerd_fonts yes
set -g theme_powerline_fonts no 

set -g theme_color_scheme solarized-dark
set -g theme_newline_cursor yes
set -g theme_title_display_user yes
set -g theme_title_display_process yes
set -g theme_display_cmd_duration yes

set -g fish_user_paths "/usr/local/opt/openssl@1.1/bin" $fish_user_paths

fish_vi_key_bindings
