# name: odie

if test $last_status = 0
  set arrow " $green▸"
else
  set arrow " $red▸"
end

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
    set -l cwd $yellow(prompt_pwd)

    if test "$USER" != "$CURRENT_USER"
    set -l user_prompt "$green$USER$normal$separator"
    end

    if test "$SSH_CLIENT" != ""
    set -l host_prompt "$cyan$hostname$normal$separator"
    end

    set -l cwd_prompt "$cwd$normal"

    set -l prompt "$user_prompt$host_prompt$cwd_prompt$arrow$normal "

    echo -n $prompt
end


