# .config-fish

fish の config とか function とかをまとめておくためのディレクトリ

## 使い方

### インストール（というかデプロイ？）

fish の config ディレクトリ（`~/.config/fish` とする）をバックアップする

```sh
cd ~/.config
mv fish fish.bak.d
```

このリポジトリをクローンする

```sh
git clone https://github.com/AAAR-Salmon/.config-fish.git ~/.config/fish
```

シェルを再起動してちゃんと反映されているか確認する
確認できたらバックアップは消しても良い

```sh
# ！！必ず確認してから！！
rm -rf ~/.config/fish.bak.d
```

### アップデート

Git リポジトリなので commit して push したり pull したりする
