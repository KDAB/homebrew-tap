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
./update_one.py kdreports-qt6.rb 2.3.0
```

Or to open a PR automatically:

```bash
./update_one.py kdreports-qt6.rb 2.3.0 --pr KDAB/homebrew-tap
```

## Adding new packages

Besides adding a new `<package>.rb` file also adapt `.github/workflows/build.yml` and `utils.py`.

## Documentation

`brew help`, `man brew` or check [Homebrew's documentation](https://github.com/Homebrew/homebrew/tree/master/share/doc/homebrew#readme).
