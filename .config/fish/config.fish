function fish_prompt
  set_color $fish_color_cwd
  echo (pwd) (set_color normal) '[' (git_current_branch) '] ✈  '
end

# Decorate cd to list folder contents
# function cd
#   cd $argv
#   ls
# end

# Reload fish config
function reload -d "Reload fish config file"
  . ~/.config/fish/config.fish
end

function fishrc
  vim ~/.config/fish/config.fish
  reload
end

function disablespotlight
  sudo launchctl unload -w /System/Library/LaunchDaemons/com.apple.metadata.mds.plist
end

function enablespotlight
  sudo launchctl load -w /System/Library/LaunchDaemons/com.apple.metadata.mds.plist
end


# base16 color scheme
eval sh $HOME/Dev/config/colors/base16-shell/base16-tomorrow.dark.sh


set fish_greeting ""
set -U BROWSER "open"
set -x EDITOR "vim"
set -x GOPATH /usr/local/share/go

set -x PATH /usr/local/bin $PATH
set -x PATH ~/.cabal/bin $PATH
# set -x PATH /Applications/Postgres.app/Contents/MacOS/bin $PATH
set -x PATH /usr/local/share/npm/bin $PATH
set -x PATH /usr/local/share/go/bin $PATH
