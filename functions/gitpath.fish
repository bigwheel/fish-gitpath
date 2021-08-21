function gitpath
  argparse -n gitpath 'h/help' -- $argv
    or return 1

  if set -lq _flag_h
    _gitpath_print_help
    return
  end

  if not git rev-parse --is-inside-work-tree > /dev/null 2>&1
    _gitpath_print_error 'Not in a git repository'
    return 2
  end

  set -l root_path (git rev-parse --show-toplevel)
  set -l relative_path $argv[1]

  if test -z "$relative_path"
    echo $root_path
  else
    echo $root_path/$relative_path
  end
end

function _gitpath_print_help
  echo 'Usage: gitpath [OPTION] [RELATIVE_PATH]
Fish shell plugin to use paths in git repository.
If RELATIVE_PATH isn\'t specified, gitpath function returns git repository root directory,
else returns abusolute path that is concatenated by git root path and RELATIVE_PATH.

-h, --help    display this help and exit'

end

function _gitpath_print_error
  echo "gitpath: $argv
Try '-h' or '--help' option for more information." 1>&2
end
