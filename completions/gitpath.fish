complete -c gitpath -x
complete -c gitpath -n '__fish_is_first_token' -s h -l help -d 'Display this help and exit'
complete -c gitpath -n '__fish_is_first_token' -xa '(_gitpath_complete_path)'

function _gitpath_complete_path
  if not git rev-parse --is-inside-work-tree > /dev/null 2>&1
    # not in git working tree
    return 2
  end

  set -l root_path (git rev-parse --show-toplevel)
  _gitpath_fish_complete_files $root_path (commandline -tc)
end

function _gitpath_fish_complete_files
  set -l base_directory $argv[1]
  set -l current $argv[2]

  # remove / to end if exists
  set base_directory (echo $base_directory | string trim -r -c /)
  # add/ to end
  set base_directory {$base_directory}/

  set -l dirs (
    complete -C"_gitpath_not_exist_command_for_completion_file_xxx $base_directory$current" \
      | string replace $base_directory ''
  )

  if set -q dirs[1]
    printf "%s\n" $dirs
  end
end

