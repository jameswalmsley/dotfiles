if test (uname -s) = "Darwin"
    set -gx PATH /usr/local/opt/coreutils/libexec/gnubin $PATH
    set -gx PATH /usr/local/opt/gnu-sed/libexec/gnubin $PATH

    sed -i s:[[:space:]]/bin/grep:/usr/bin/grep:g ~/.local/share/omf/themes/budspencer/fish_prompt.fish
end

