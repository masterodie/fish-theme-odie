# name: odie (based on mars)

function fish_prompt
  set -l hostname (hostname | string replace -r '\..*' '')
  set -l separator '::'
  set -l last_status $status
  set -l cyan (set_color -o cyan)
  set -l yellow (set_color -o yellow)
  set -l red (set_color -o red)
  set -l blue (set_color -o blue)
  set -l green (set_color -o green)
  set -l magenta (set_color -o magenta)
  set -l normal (set_color normal)

  if test $last_status = 0
      set arrow " $green▸"
  else
      set arrow " $red▸"
  end
  set -l cwd $yellow(prompt_pwd)

  echo -n -s "$green$USER$normal$separator$cyan$hostname$normal$separator$cwd$normal$arrow$normal "
end


