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

# Base16 Shell
if status --is-interactive
  eval sh $HOME/.config/base16-shell/scripts/base16-default-dark.sh
end

function nvm
  bass source (brew --prefix nvm)/nvm.sh --no-use ';' nvm $argv
end

set -x NVM_DIR ~/.nvm
nvm use default --silent

set fish_greeting ""
set -U BROWSER "open"
set -x EDITOR "vim"
set -x JAVA_HOME (/usr/libexec/java_home -v "11")
set -x GOPATH /usr/local/share/go
set -x PATH /usr/local/bin $PATH
# set -x PATH (yarn global bin) $PATH
# set -x PATH $HOME/.yarn/bin $PATH
set -x PATH $HOME/.config/yarn/global/node_modules/.bin $PATH

# Remove this to upgrade node to a different major version
# set -g fish_user_paths "/usr/local/opt/node@10/bin" $fish_user_paths
