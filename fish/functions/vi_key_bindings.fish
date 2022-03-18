function vi_key_bindings
    bind -s --preset -M default n up-line
    bind -s --preset -M default e down-line
    bind -s --preset -M default i forward-char

    bind -s --preset -m insert l repaint-mode
    bind -s --preset -m insert L beginning-of-line repaint-mode
end
