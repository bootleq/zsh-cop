function cop() {
  if [[ -r Gemfile ]]; then
    _cop_ruby $*
  elif [[ -r shadow-cljs.edn ]]; then
    _cop_clj $*
  else
    echo "Sorry, no cop for current directory."
  fi
}

function _cop_ruby() {
  local exts=('rb,thor,builder,jbuilder,pryrc')
  local excludes=':(top,exclude)db/schema.rb'
  local extra_options='--display-cop-names --rails'

  if [[ $# -gt 0 ]]; then
    local files=$(eval "noglob git diff $@ --diff-filter=d --name-only -- *.{$exts} $excludes")
  else
    local files=$(eval "noglob git status --porcelain -- *.{$exts} $excludes | sed -e '/^\s\?[DRC] /d' -e 's/^.\{3\}//g'")
  fi

  if [[ -n "$files" ]]; then
    echo $files | xargs bundle exec rubocop `echo $extra_options`
  else
    echo 'Nothing to check (rubocop).'
  fi
}

function _cop_clj() {
  local exts=('clj,cljs,cljc,edn')
  local excludes=':(top,exclude).shadow-cljs'

  if [[ $# -gt 0 ]]; then
    local files=$(eval "noglob git diff $@ --diff-filter=d --name-only -- *.{$exts} $excludes | sed -e 's%^'$(git rev-parse --show-prefix)'%%' | paste -sd ' '")
  else
    local files=$(eval "noglob git status --porcelain -- *.{$exts} $excludes | sed -e '/^\s\?[DRC] /d' -e 's/^.\{3\}//g' -e 's%^'$(git rev-parse --show-prefix)'%%' | paste -sd ' '")
  fi

  if [[ -n "$files" ]]; then
    clj-kondo --config "{:output {:progress true}}" --lint `echo $files`
  else
    echo "Nothing to check (clj-kondo)."
  fi
}
