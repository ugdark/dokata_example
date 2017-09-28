# dokata_example
実業務で使う場合の構成例をあげる。  
dokataは個人のrepositoryでいつ消されるかわからないのものと想定した方がよい  


## プロダクト 構築例 
このようなフォルダ構成にしてるのは  
でかいProjectでもないしProjectの切り替えがめんどいからまとめた  
使ってるIDEはIDEAです。

### 簡単 (not submodule) それかsubmoduleで
とりあえず簡単だから。  
submodule + git remote 個別追加でもいいかと思ってる。試してない。  
- メリット
  - 簡単
  - 更新も可。
- デメリット
  - checkout がめんどい。deployを書いた時等
  - submoduleならcheckoutは解決可

```bash
git clone git@github.com:ugdark/dokata_examples.git
cd modules
git clone git@github.com:ugdark/examples_ruby.git examples
git clone git@github.com:ugdark/dokata.git
```

### github subtree設定
これを会社では採用。  
リポジトリを３つ持ち会社でもOSSを取り込みOSSにも貢献がしやすい。  
後は個人リポジトリのみのものでメンテが廃れても内部に取り込まれてるので大丈夫  

#### リポジトリ追加
```bash
git remote add github-dokata git@github.com:ugdark/dokata.git
git remote add github-examples git@github.com:ugdark/examples_ruby.git
```
#### 追加 (一回のみ)
```bash
git subtree add --prefix=modules/dokata github-dokata master # 外部のリポジトリから追加してれば不要
git subtree add --prefix=modules/examples github-examples master # 外部のリポジトリから追加してれば不要
```

#### OSS側の取得更新(pushも可)
```bash
git subtree pull --prefix=modules/examples github-examples master
git subtree pull --prefix=modules/dokata github-dokata master
```

## appフォルダについて
業務で使う処理はアプリケーションという感じにしてインスタンス持ったり  
する事を考えるとlib(ライブラリと認識)に置きたくなかった。  
railsを参考にappにした。  
DDDでいうとドメイン層を意識してます。  

## exe example
```bash
./exe/yosenabe ruizu yamada
```

## 初期設定
```bash
./bin/setup
```

## テスト
```bash
bundle exec rake test
```
## yard 使い方

### docを作る
```bash
bundle exec yard 
```

### docを見る
```bash
bundle exec yard server
```

## bundle 使い方

### install
初回のみ
```bash
bundle install --path vendor/bundle
```

### update
Gemfileに記述されたgemを一括でバージョンアップデートする。  
※ たまに誰か更新する。  

```bash
bundle update
```
## rubocop
コードチェックと整形も一部

### 現在の違反をチェック
途中からの導入だったので違反が多すぎるのでまずは  
今の違反一覧を作成
```bash
bundle exe rubocop --auto-gen-config
```

### 自動適応(※一部)
option -a(--auto-correct) を使用
```bash
bundle exe rubocop -a
```
