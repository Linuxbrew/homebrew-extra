# Contributing to homebrew-extra

[Homebrew-extra](https://github.com/Linuxbrew/homebrew-extra) contains formulae that are only available and/or only useful on Linux.

### Report a bug

* run `brew update` (twice)
* run and read `brew doctor`
* read [the Troubleshooting Checklist](http://docs.brew.sh/Troubleshooting.html)
* open an issue on the formula's repository

### Submit a version upgrade for the `foo` formula

* check if the same upgrade has been already submitted by [searching the open pull requests for `foo`](https://github.com/Linuxbrew/homebrew-extra/pulls?utf8=✓&q=is%3Apr+is%3Aopen+foo).
* `brew bump-formula-pr --strict foo` with `--url=...` and `--sha256=...` or `--tag=...` and `--revision=...` arguments.

### Add a new formula for `foo` version `2.3.4` from `$URL`

First, please make sure that [the formula belongs in this tap](#what-formulae-belong-here).

* read [the Formula Cookbook](http://docs.brew.sh/Formula-Cookbook.html) or: `brew create $URL` and make edits
* `brew install --build-from-source foo`
* `brew audit --new-formula foo`
* `git commit` with message formatted `foo 2.3.4 (new formula)`
* [open a pull request](http://docs.brew.sh/How-To-Open-a-Homebrew-Pull-Request.html) and fix any failing tests

### Contribute a fix to the `foo` formula

* `brew edit foo` and make edits
* leave the [`bottle`](http://www.rubydoc.info/github/Homebrew/brew/master/Formula#bottle-class_method) as-is
* `brew uninstall --force foo`, `brew install --build-from-source foo`, `brew test foo`, and `brew audit --strict foo`
* `git commit` with message formatted `foo: fix <insert details>`
* [open a pull request](http://docs.brew.sh/How-To-Open-a-Homebrew-Pull-Request.html) and fix any failing tests

## What formulae belong here?

* A new formula that works on Mac or Linux should go in Homebrew/core.
* A new formula that is Linux-only, and a formula in Linuxbrew/core depends on it, should go in Linuxbrew/core.
* A new formula that is Linux-only, and no formula in Linuxbrew/core depends on it, should go in Linuxbrew/extra.

Thanks!
