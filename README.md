# dokata_example
実業務で使う場合の構成例をあげる。  
dokataは個人のrepositoryでいつ消されるかわからないのものと想定した方がよい  


## checkuout 構築例

```bash
git clone git@github.com:ugdark/dokata_examples.git
cd modules
git clone git@github.com:ugdark/examples_ruby.git examples
git clone git@github.com:ugdark/dokata.git
```

業務側ではdokata_examplesが置き換わる。  
examples,dokata は会社のbacketにも同様にコミットしているので  
リモートを追加して両方にコミットしてる。  

```bash
cd modules/examples
git remote add office #{office_repository}
cd modules/dokata
git remote add office #{office_repository}
```

このようなフォルダ構成にしてるのは  
でかいProjectでもないしProjectの切り替えがめんどいからまとめた  
使ってるIDEはIDEAです。

## appフォルダについて
業務で使う処理はアプリケーションという感じにしてインスタンス持ったり  
する事を考えるとlib(ライブラリと認識)に置きたくなかった。  
railsを参考にappにした。  
DDDでいうとドメイン層を意識してます。  

## exe example
```bash
./exe/yosenabe.rb yamada
```