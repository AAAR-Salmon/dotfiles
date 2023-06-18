# thanks to @lvlts and @JeppeKlitgaard
# https://github.com/microsoft/WSL/issues/5065#issuecomment-812201144
function fix-wsl2-interop
    for i in (pstree -np -s $fish_pid | grep -o -E '[0-9]+')
        if test -e "/run/WSL/"$i"_interop"
            set -x WSL_INTEROP "/run/WSL/"$i"_interop"
        end
    end
end
