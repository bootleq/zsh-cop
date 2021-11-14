# cop

Simple command `cop` to run code linter (currently only [rubocop][] and [clj-kondo][]).

Detects git-diff, only check changed files.


Disclaimer
==========

Mainly for my personal use, won't work hard to add features.


Usage
=====

Go to directory contains `Gemfile` or `shadow-cljs.edn`.

- Check changed `rb|thor|builder|jbuilder|pryrc` or `clj|cljs|cljc|edn` files, except for (git) Deleted, Renamed and Copied ones, and `db/schema.rb`, `.shadow-cljs/`.

        cop


- Can provide more git-diff options to target files. e.g.,

        cop master...HEAD


Install
=======

Just source `bin/cop.zsh` script.


Or use plugin managers, for example:

- zcomet

        zcomet trigger cop bootleq/zsh-cop bin

- zplug

        zplug 'bootleq/zsh-cop', use:'bin/*.zsh'

- zimfw

        zmodule bootleq/zsh-cop --source bin/cop.zsh

- zinit

        zinit ice pick'bin/*.zsh'
        zinit light 'bootleq/zsh-cop'


[rubocop]: https://github.com/rubocop-hq/rubocop
[clj-kondo]: https://github.com/borkdude/clj-kondo
