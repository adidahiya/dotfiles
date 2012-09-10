# Set the prompt
function fish_prompt
  if test -z (git branch --quiet 2>| awk '/fatal:/ {print "no git"}')
    printf '%s%s%s [%s] %s✈ ' (set_color $fish_color_cwd) (prompt_pwd) (set_color normal) (git_current_branch) (set_color normal)
  else
    printf '%s%s%s ✈ ' (set_color $fish_color_cwd) (prompt_pwd) (set_color normal)
  end
end

# Decorate cd to list folder contents
function cd
  cd $argv
  ls
end

# Reload fish config
function reload -d "Reload fish config file"
  . ~/.config/fish/config.fish
end

function fishrc
  vim ~/.config/fish/config.fish
  reload
end

set -U BROWSER 'open'

