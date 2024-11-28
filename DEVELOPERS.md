Before starting, be sure to `git submodule init && git submodule update`

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
