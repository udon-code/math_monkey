# Math Monkey

筆算問題シート生成プログラム

* 生成済みPDF[ダウンロードページ](https://udon.little-pear.net/column-addition-worksheets)

## 機能概要

* texフォーマットで出力
* 足し算、引き算
* 乱数を用いた問題で毎回異なる問題を生成
* 最大・最小の桁数を指定可能
* 桁上がり/桁下がりあり、なしの指定
* 使う数を2から最大20まで選択可能
* 答えページの生成

## 前準備

### Texのインストール
本プログラムはtexファイルを出力するため、pdfに変換するためには
Tex環境のインストールが必要です。
おすすめは[TeX Live](https://texwiki.texjp.org/?TeX%20Live)です。

### 使用Pythonパッケージ

* Jinja2

## コマンド例
### 3桁の足し算問題を100個生成 (桁上がりなし)
```
% python scripts/math_monkey.py \  # 
    -t add                      \  # 足し算
    -o add_3digits_100.tex      \  # 出力ファイル名
    -n 100                      \  # 100問出力
    --digits 3                  \  # 3桁 + 3桁
    --min_digits 3                 #
```

### 3桁の引き算問題 (桁下がりあり)
```
% python scripts/math_monkey.py \  # 
    -t sub                      \  # 足し算
    -o sub_3digits_100.tex      \  # 出力ファイル名
    -n 100                      \  # 100問出力
    --inc_carry_over            \  # 桁下がりあり
    --digits 3                  \  # 3桁 - 3桁
    --min_digits 3                 #
```

### 10桁までの数10個の足し算 (答えも生成)
```
% python scripts/math_monkey.py \  # 
    -t sub                      \  # 足し算
    -o sub_10digits_x10_10.tex  \  # 出力ファイル名
    -n 10                       \  # 10問出力
    --num_augend 10             \  # 10個の数
    --inc_carry_over            \  # 桁上がりあり
    --digits 10                 \  # 最大10桁
    --min_digits 1              \  # 最小1桁
    --answer                       # 答えも生成
```
