#!/bin/bash

#setup

brew --version

# brewがなければ、エラー”brewをインストールしてください”

# ghがインストールされていたら、brew update gh
brew list

# インストール
brew install gh

# 認証
gh auth login