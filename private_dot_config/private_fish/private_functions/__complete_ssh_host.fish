function __complete_ssh_host
    type fzf >/dev/null || return 1

    set -l ssh_config_files /etc/ssh/ssh_config ~/.ssh/config
    for config_file_path in $ssh_config_files
        for include_path in (command grep -ri Include $config_file_path | command grep -v '#' | string replace -ri -- '.*\s*Include\s+(.*)' '$1')
            if string match -qri -- '^~/' $include_path
                or string match -qri -- '^\$HOME/' $include_path
                for file_path in (string split ' ' (eval echo $include_path))
                    test -f $file_path
                    and set ssh_config_files $ssh_config_files $file_path
                end
            else
                for file_path in (string split ' ' (eval echo (dirname $config_file_path)/$include_path))
                    test -f $file_path
                    and set ssh_config_files $ssh_config_files $file_path
                end
            end
        end
    end
    command egrep -i '^Host\s+.+' $ssh_config_files | string replace -ri '[^\s]+\s+(.*)' '$1' | string replace -ra '\s' ' ' | string split ' ' | command egrep -v '[*?]' | sort -u | fzf | tr '\n' ' ' | read -l host

    if test -n "$host"
        commandline -a "$host"
    end
    commandline -f repaint
end
