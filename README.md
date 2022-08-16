

## zsh config

``` bash
sudo zsh install.sh
```

## zsh plugin config

use git submodule

```
git submodule add git@github.com:spaceship-prompt/spaceship-prompt.git spaceship-prompt --depth=1
git submodule add git@github.com:zsh-users/zsh-autosuggestions.git ./zsh/plugins/zsh-autosuggestions --depth=1
git submodule add git@github.com:zsh-users/zsh-syntax-highlighting.git ./zsh/plugins/zsh-syntax-highlighting --depth=1
git submodule add git@github.com:agkozak/zsh-z.git ./zsh/plugins/zsh-z --depth=1
git submodule add git@github.com:supercrabtree/k.git ./zsh/plugins/k --depth=1

```
first install
```
 git submodule update --init --depth 1
```
  update submodule
```
git submodule update --recursive --remote --depth 1
```


# karabiner
在登录项时将这个本目录下Karabiner-Loader.app设置为开机自启，至此以后电脑开机就不会Karabiner的窗口


## TODO
<!-- - [x]  -->
- [ ] need fast search bookmarks(like use c/c++)
- [ ] use sqlite3 parse history to search
- [ ] refactor search code
- [ ] tip page 
- [ ] more
