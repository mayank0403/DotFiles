export LANG=en_US.UTF-8
set -g theme_project_dir_length 1
set -g theme_nerd_fonts yes
set -g theme_powerline_fonts no

set -g theme_color_scheme gruvbox
set -g theme_newline_cursor yes
set -g theme_title_display_user yes
set -g theme_title_display_process yes
set -g theme_display_cmd_duration yes
set -g theme_display_git yes
set -g theme_display_git_dirty yes
set -g theme_display_git_untracked no
set -g theme_display_git_ahead_verbose yes
set -g theme_display_git_dirty_verbose no
set -g theme_display_git_stashed_verbose yes
set -g theme_git_worktree_support no
set -g theme_display_vagrant yes

set -g fish_user_paths "/usr/local/opt/openssl@1.1/bin" $fish_user_paths

fish_vi_key_bindings

thefuck --alias | source

# opam configuration
source /Users/mayankrathee/.opam/opam-init/init.fish > /dev/null 2> /dev/null; or true

# iterm2 fish title
# https://www.santoshsrinivas.com/setting-the-title-bar-in-an-iterm-using-a-fish-shell/
# https://superuser.com/questions/83626/how-do-i-set-the-title-of-terminal-app-with-the-fish-shell/329277#329277
