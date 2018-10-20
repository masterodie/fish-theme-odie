# name: odie

function fish_prompt

    set -l last_status $status
    set -l hostname (hostname | string replace -r '\..*' '')
    set -l separator '::'
    set -l cyan (set_color -o cyan)
    set -l yellow (set_color -o yellow)
    set -l red (set_color -o red)
    set -l blue (set_color -o blue)
    set -l green (set_color -o green)
    set -l magenta (set_color -o magenta)
    set -l normal (set_color normal)
    set -l cwd $yellow(prompt_pwd)

    if test $last_status = 0
      set arrow " $green▸"
    else
      set arrow " $red▸"
    end

    set -l user_prompt ""
    if test "$USER" != "$DEFAULT_USER" and test $USER = "root"
        if test "$USER" = "root"
            set color $red
        else
            set color $green
        end
        set user_prompt "$color$USER$normal$separator"
    end

    set -l host_prompt ""
    if test "$SSH_CLIENT" != ""
        set host_prompt "$cyan$hostname$normal$separator"
    end

    set -l cwd_prompt "$cwd$normal"

    echo -n -e "$user_prompt$host_prompt$cwd_prompt$arrow$normal "
end


