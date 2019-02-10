declare-option str-list autoload_ignore

define-command ignore-system -params 1 -docstring 'Add a file or pattern to the autoload ignore list' %{
  set-option -add global autoload_ignore "%arg{1}"
}

define-command load-system -docstring 'Load system-provided .kak scripts' %{
  evaluate-commands %sh{
    greplist="-e ^$"
    eval set -- "$kak_opt_autoload_ignore"
    while [ $# -gt 0 ]; do
      greplist="$greplist -e $1.kak"
      shift
    done
    grepcmd="grep -v $greplist"
    ignorecmd="grep $greplist"
    find -L "${kak_runtime}/autoload" -type f -name '*\.kak' \
      | $grepcmd \
      | sed 's/.*/try %{ source "&"; echo -debug Autoloaded "&" } catch %{ echo -debug Autoload: could not load "&" }/'
    find -L "${kak_runtime}/autoload" -type f -name '*\.kak' \
      | $ignorecmd \
      | sed 's/.*/echo -debug Autoload ignored "&"/'
  }
}
