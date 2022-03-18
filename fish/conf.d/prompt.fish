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

function fish_prompt
        printf '\n%s%s%s @ %s%s%s : %s%s%s\n%s%s%s ' \
        (set_color cyan) (echo $USER) (set_color normal) \
        (set_color green) (hostname) (set_color normal) \
        (set_color yellow) (prompt_pwd) (set_color normal) \
        (set_color red) (echo ">") (set_color normal)
end
