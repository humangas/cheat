# cheat
My Cheat Sheet


## Setup
Install [mkdocs-material](https://squidfunk.github.io/mkdocs-material/). mkdocs-material is MkDocs theme.
In the following, I use pyenv to manage python's environment.
```
$ brew install pyenv
$ brew install pyenv-virtualenv

$ pyenv install 3.6.5
$ pyenv virtualenv 3.6.5 365_mkdocs

$ pyenv shell 365_mkdocs
$ pip install mkdocs-material
```

Create My Cheat Sheet Repository
```
$ hub create cheat
$ ghq get git@github.com:humangas/cheat.git
```
- hub: brew install hub
- ghq: brew install ghq 


Setup MkDocs environment
```
$ cd $GOPATH/src/github.com/humangas/cheat
$ pyenv local 365_mkdocs
$ mkdocs new temp
$ mv temp/* .
$ rm -rf temp
$ vim mkdocs.yml
$ cat mkdocs.yml
site_name: humangas's cheat sheet
site_description: humangas's cheat sheet
site_author: humangas
copyright: Copyright (c) 2018 humangas
repo_name: GitHub
site_url: https://humangas.github.io/cheat/
repo_url: https://github.com/humangas/cheat/
edit_uri: edit/master/_docs/
google_analytics: ['UA-43176477-6', 'auto']
theme:
  name: 'material'
  language: 'ja'
docs_dir: '_docs'
site_dir: 'docs'
extra:
  search:
    language: 'jp'

```


## Git Settings
```
$ cd $GOPATH/src/github.com/humangas/cheat
$ vim .gitignore
$ cat .gitignore
site/
.python-version
```

Settings > Options > GitHub Pages > Source: 
- master branch /docs folder


## Testing Views
```
$ mkdocs serve
```


## Build
Use CircleCI: See [.circleci/config.yml](https://github.com/humangas/cheat/blob/master/.circleci/config.yml)


