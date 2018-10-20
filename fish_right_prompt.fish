function _git_branch_name
  echo (command git symbolic-ref HEAD ^/dev/null | sed -e 's|^refs/heads/||')
end

function _is_git_dirty
  echo (command git status -s --ignore-submodules=dirty ^/dev/null)
end

function fish_right_prompt
  set -l cyan (set_color -o cyan)
  set -l yellow (set_color -o yellow)
  set -l red (set_color -o red)
  set -l blue (set_color -o blue)
  set -l green (set_color -o green)
  set -l magenta (set_color -o magenta)
  set -l normal (set_color normal)

  if [ (_git_branch_name) ]
    set git_branch (_git_branch_name)

    if [ (_is_git_dirty) ]
      set git_info "$yellow$git_branch±"
    else
      if test (_git_branch_name) = 'master'
        set git_info "$red$git_branch"
      else
        set git_info "$normal$git_branch"
      end
    end
  end

  echo -n "$git_info$normal"

# Do nothing if not in vi mode
  if set -q vi_mode_default
  switch $fish_bind_mode
  case default
  set_color --bold --background red white
  echo '[N]'
  case insert
  set_color --bold --background green white
  echo '[I]'
  case visual
  set_color --bold --background magenta white
  echo '[V]'
  end
  set_color normal
  echo -n ' '
  end
end
