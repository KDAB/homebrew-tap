# Homebrew formulas for KDAB projects

## How to install the formulae

First add this tap to your homebrew using (you only need to do this
once to initialize the tap):

`brew tap KDAB/tap`

Then install a formula using

```bash
brew install <formula>
```

## Updating versions

See outdated versions with:

```bash
./info.py
```

Update a version with:

```bash
./update.py kdreports-qt6.rb 2.3.0
```

Or to open a PR automatically:

```bash
./update.py kdreports-qt6.rb 2.3.0 --pr KDAB/homebrew-tap
```

## Documentation

`brew help`, `man brew` or check [Homebrew's documentation](https://github.com/Homebrew/homebrew/tree/master/share/doc/homebrew#readme).
