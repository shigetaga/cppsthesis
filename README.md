# cppsthesis &mdash; College of Policy and Planning Sciences Graduate Thesis Document Class (unofficial)
筑波大社工卒論&梗概用LaTeXテンプレート（非公式）

指定される体裁に合わせた
- 卒論用クラスファイル「cppsthesis.cls」（jsarticle や jsreport のようなもの）
- 梗概原稿テンプレート「xxxxxxxxxabstract.tex」

を提供します。

現在のものは全て2021年度の卒業研究論文作成要領に従ったものです。2022年度の要領が公開され次第、対応を進める予定です。

## 簡単な説明
卒論用クラスファイルは論文本体の.texファイルと同じディレクトリ（フォルダ）において、他の文書クラスと同じように`\documentclass{cppsthesis}`で読み込んで使用します。その他、クラスオプションなどの詳細な説明は「cppsthesis.pdf」をご覧ください。

梗概原稿テンプレートはそのまま直接書き込んで原稿ソースファイルとして使用します。名前の「xxxxxxxxx」部分を学籍番号に書き換えてお使いください。使い方についての詳細な説明は「abstract_template.pdf」をご覧ください。

## 入手方法
ダウンロードは右の「Releases」から。2022/06/17現在、最新版は「論文v2.2.0　梗概v2.1.0」です。  

## 含まれるファイルについて
- LICENSE：クラスファイルのライセンスが書いてあるファイルです。拡張子はありませんが、Windowsの「メモ帳」などで開くと読めます。
- README.md：今読んでいるこのファイルです。Markdownで記述されています。
- cppsthesis.cls：卒論用クラスファイルです。卒論の.texファイルと同じディレクトリに置いてください。
- cppsthesis.pdf：cppsthesis.clsの説明書です。
- xxxxxxxxxabstract.tex：梗概原稿テンプレートです。こちらは直接書き込んで使用します。
- abstract_template.pdf：xxxxxxxxxabstract.texの説明書です。

## 注意（免責）
この文書クラスの使用に伴う結果について制作者は一切責任を負いません。  
卒論用クラスファイルについてはMITライセンスを採用しています。「LICENSE」をご覧ください。（普通にダウンロードして使う分には問題になることはまず無いです。）  
梗概原稿テンプレートについては0条項BSDライセンスを採用しています。「abstract_template.pdf」をご覧ください。（実質的にパブリックドメインのライセンスです。ご自由にお使いください。）
