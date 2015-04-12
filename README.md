# vim composer
Manage [composer](https://getcomposer.org) in Vim

```vim
:ComposerRun <args>
```
To run command for example `:ComposerRun validate` run command validate for your json

```vim
:ComposerGet
```
This command exec the installation flow of composer's install. This process require `curl`

```vim
:ComposerInstall [--no-dev ..]
```
This command exec `composer install`

```vim
:ComposerJSON
```
This command open `composer.json`

## Install
```vim
Bundle 'vim-php/vim-composer'
```

## Force composer phar
This plugin support an autodetach test to check the correct path of composer.phar
If this check fails you can try to force correct path
```
let g:composer_cmd = "/usr/bin/composer"
```

## Contrib
This plugin is very easy, there is a lot of space for community update, feedback and
features request.
Help me with issues and PRs!
Thanks!
