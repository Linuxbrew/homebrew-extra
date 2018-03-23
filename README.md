# Linuxbrew Extra

[Linuxbrew Extra](https://github.com/Linuxbrew/homebrew-extra) is a collection of
Linux-only formulae for [Linuxbrew](https://github.com/Linuxbrew/brew) that are not dependencies of formulae
in [Linuxbrew Core](https://github.com/Linuxbrew/homebrew-core).

## How do I install these formulae?

### Method 1
```
brew tap linuxbrew/extra # needed only once
brew install <formula>
```

### Method 2
```
brew install linuxbrew/extra/<formula>
```

### Method 3

Just like any other, you can install Linuxbrew/extra formulae _via_ URL (in which case they will not be updated with `brew update`):

```
brew install https://raw.githubusercontent.com/Linuxbrew/homebrew-extra/master/Formula/<formula>.rb
```

## Contributing

Do you have a package that is not a dependency of formulae in Linuxbrew/core?
Open an [Issue](https://github.com/Linuxbrew/homebrew-extra/issues/new) here or submit a Pull Request!

## Documentation

1. `brew help`
2. `man brew`
3. [Homebrew's documentation](https://github.com/Homebrew/brew/tree/master/docs#readme).
