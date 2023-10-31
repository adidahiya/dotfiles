function fish_prompt
  set_color $fish_color_cwd
  echo (pwd) (set_color normal) '[' (git_current_branch) '] ✈  '
end

# Reload fish config
function reload -d "Reload fish config file"
  . ~/.config/fish/config.fish
end

function fishrc
  vim ~/.config/fish/config.fish
  reload
end

function yarn-tools-fix-duplicates
  yarn-tools fix-duplicates yarn.lock > fixed-yarn.lock ;and rm yarn.lock ;and mv fixed-yarn.lock yarn.lock
end

set -x NVM_DIR ~/.nvm
load_nvm > /dev/stderr

set fish_greeting ""
set -U BROWSER "open"
set -x EDITOR "vim"
set -x PATH /usr/local/bin $PATH
set -x PATH /opt/homebrew/bin/ $PATH
