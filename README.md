# cop

Simple command `cop` to run code linter (currently only [rubocop][] and [clj-kondo][].

Detects git diff and only check changed files.


Disclaimer
==========

This command is mainly for my personal use, won't work hard to add features.


Usage
=====

Go to directory contains `Gemfile` or `shadow-cljs.edn`

- Check changed `*.(rb|thor|builder|jbuilder|pryrc)` files, except for (git) Deleted, Renamed and Copied ones, and `db/schema.rb`.

    cop


- Can provide more git-diff options to target files. e.g.,

    cop master...HEAD


Install
=======




[rubocop]: https://github.com/rubocop-hq/rubocop
[clj-kondo]: https://github.com/borkdude/clj-kondo
