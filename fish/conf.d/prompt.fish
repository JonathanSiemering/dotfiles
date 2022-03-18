# Prompt
set fish_greeting
set -g fish_prompt_pwd_dir_length 0

set fish_color_command green
set fish_color_keyword green
set fish_color_quote yellow
set fish_color_redirection ce7731
set fish_color_end red
set fish_color_error ff4bef
set fish_color_param 17a0e8

function fish_mode_prompt

end

function fish_prompt
    printf '\n'

    printf '%s%s%s' (set_color cyan) (echo $USER) (set_color normal)
    printf ' @ '
    printf '%s%s%s' (set_color green) (hostname) (set_color normal)
    printf ' : '
    printf '%s%s%s' (set_color yellow) (prompt_pwd) (set_color normal)

    printf '\n'

    printf '%s%s%s' (set_color red) (echo ">") (set_color normal)
    printf ' '
end

function fish_right_prompt
    fish_git_prompt
end
