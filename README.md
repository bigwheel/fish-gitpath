# fish-gitpath

## Synopsis
Fish shell plugin to use paths in git repository.

Inspired by https://github.com/mollifier/fish-cd-gitroot and https://qiita.com/bigwheel/items/9b16337cab5a82ff9649

## How to set up

### Installing using fisher
We recommend using [fisher](https://github.com/jorgebucaran/fisher) to install fish-gitpath.

```fish
fisher add bigwheel/fish-gitpath
```

## Usage

```
cd (gitpath [RELATIVE_PATH])
git log (gitpath [RELATIVE_PATH])
```

If RELATIVE_PATH isn't specified, gitpath function returns git repository root directory,
else returns abusolute path that is concatenated by git root path and RELATIVE_PATH.

## Options

\--help, -h    display help and exit
