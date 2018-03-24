# Linuxbrew Extra

[Linuxbrew Extra](https://github.com/Linuxbrew/homebrew-extra) is a collection of
formulae for [Linuxbrew](https://github.com/Linuxbrew/brew) that are not dependencies of
[Linuxbrew core formulae](https://github.com/Linuxbrew/homebrew-core) and are specific to Linux.

## How do I install these formulae?

Assuming that you have [Linuxbrew/brew](https://github.com/Linuxbrew/brew) installed, execute:

### Method 1
```
brew tap linuxbrew/extra # needed only once
brew install <formula>   # for example:  brew install man-db
```

### Method 2
You can also install your first formula in one step:
```
brew install linuxbrew/extra/<formula>
```
This will automatically add this repository to the list of repositories in your Linuxbrew installation (it will _tap_ this repository) and later on you won't have to specify `linuxbrew/extra` prefix when installing Linuxbrew/extra formulae.

### Method 3

Just like any other formula, you can install any Linuxbrew/extra formula _via_ its URL:

```
brew install https://raw.githubusercontent.com/Linuxbrew/homebrew-extra/master/Formula/<formula>.rb
```

## Contributing

- Do you have or know of a software package or tools that is not a dependency of any formulae in Linuxbrew/core? You've come to the right place!
- Open an [Issue](https://github.com/Linuxbrew/homebrew-extra/issues/new) with your request or submit a Pull Request!

## Documentation

1. `brew help`
2. `man brew`
3. [Homebrew's documentation](https://github.com/Homebrew/brew/tree/master/docs#readme).
