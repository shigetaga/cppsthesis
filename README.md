# cppsthesis
筑波大社工卒論&梗概用LaTeXテンプレート（非公式）

指定された体裁に合わせた
- 卒論用クラスファイル「cppsthesis.cls」（jsarticle や jsreport のようなもの）
- 梗概原稿テンプレート「xxxxxxxxxabstract.tex」

を提供します。

## 簡単な説明
卒論用クラスファイルは論文本体の.texファイルと同じディレクトリにおいて、他の文書クラスと同じように`\documentclass{cppsthesis}`で読み込んで使用します。その他、クラスオプションなどの詳細な説明は「cppsthesis.pdf」をご覧ください。

梗概原稿テンプレートはそのまま直接書き込んで原稿ソースファイルとして使用します。名前の「xxxxxxxxx」部分を学籍番号に書き換えればそのまま提出可能です。使い方についての詳細な説明は「abstract_template.pdf」をご覧ください。

## 入手方法
ダウンロードは右の「Releases」から。2021/12/11現在、最新版はv2.1.1です。また、v2.1.1から梗概テンプレートを同梱しています。なお、今年度（令和3年度）の要件に対応しているのはv2.x.xです。v1.0.0をダウンロードされた方はお手数ですが最新版をダウンロードして下さい。

## 含まれるファイルについて
- LICENSE：ライセンスが書いてあるファイルです。拡張子はありませんが、Windowsの「メモ帳」などで開くことができます。
- README.md：今読んでいるこのファイルです。Markdownで記述されています。
- cppsthesis.cls：卒論用クラスファイルです。.texファイルと同じディレクトリに置いてください。
- cppsthesis.pdf：cppsthesis.clsの説明書です。
- xxxxxxxxxabstract.tex：梗概原稿テンプレートです。こちらは直接書き込んで使用します。
- abstract_template.pdf：xxxxxxxxxabstract.texの説明書です。

## 注意（免責）
この文書クラスの使用に伴う結果について制作者は一切責任を負いません。「LICENSE」もご覧ください。
