## 介绍

有时在服务器上使用 VIM, 没有任何配置, 插件, 配色等, 用的很难受

所有就有了这个仓库:

- 轻量级(不需要安装很多插件)
- 直接 git clone, 然后执行脚本一键安装

## 快速开始

```sh
git clone https://github.com/liaohui5/light-vim-starter && cd light-vim-starter

chmod +x

./install.sh
```

## 安装 [vim-easymotion](https://github.com/easymotion/vim-easymotion) (可选)

1. 启动 vim 
2. 在命令模式种输入 `:PlugInstall`

## 卸载配置

```sh
chmod +x ./uninstall.sh
./uninstall.sh
```
