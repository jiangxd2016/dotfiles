

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
git submodule add git@github.com:jeffreytse/zsh-vi-mode.git ./zsh/plugins/zsh-vi-mode --depth=1


```

> zhs-vim-mode会使代码的高亮消失,所以不再使用

first install
```
 git submodule update --init --depth 1
```
  update submodule
```
git submodule update --recursive --remote --depth 1
```


# karabiner
在登录项时将这个本目录下Karabiner-Loader.app设置为开机自启，至此以后电脑开机就不会出现Karabiner的窗口


# im-select
> 默认windows下，英文输入法为1033，中文为2052
> ctrl+shift 切换键盘，shift 切换输入法

 - windows下，必须选择安装英语键盘，才能切换到英文输入法。
 - 默认安装到了D盘，必须有这个盘


## TODO
<!-- - [x]  -->
- [ ] need fast search bookmarks(like use c/c++)
- [ ] use sqlite3 parse history to search
- [ ] refactor search code
- [ ] tip page 
- [ ] more


[rsshub](https://docs.rsshub.app/zh/routes/programming#%E7%83%AD%E9%97%A8
)
