# こつつみ

## 概要
「節約、我慢の習慣化を支援し、欲しかったものを買う」
買いたいものがあるが何故かお金が貯まらない、何気なく使ってしまう無駄遣い、その目標と課題を可視化し習慣化するサポーツツール

## URL
https://cotsutsumi.work

## 製作背景
- 支出管理できていないために起きる貯蓄ができない悩み
- 家計簿をつけたことはあるが面倒ですぐにやめてしまった
- 支出を減らせている／お金が貯まっている感覚がない  
このような経験をしている人が多いのでは？と思い、手軽に支出管理できれば少額でもお金が貯まり、支出や貯蓄への意識の向上がされるのではないか、と推測し製作ました。
私自身、大学生以降支出管理ができておらず急激に貯蓄が減ったり、貯蓄額の変化が全くない経験をしました。
対策として家計簿をアプリやエクセルで作ってみたものの、家計簿を作ることに時間がかかったり、入力の手間が多すぎて数ヶ月で辞めてしまいました。
その経験から「手間がかからず」「一目で成果がわかる」を第一目標として、いかに継続して使ってもらえることを目指し製作いたしました。

## ターゲットユーザー
- 20〜40代　男女問わず（理由：スマホを使いこなし、少額でも貯めたいニーズが高そうだと感じているから）
- 貯蓄やお金の収支を気にし出す頃の社会人（理由：家計簿アプリやエクセルで管理しようとしたが手間で挫折した経験が多そうなため）

## 主な利用シーン
- 毎日HPにアクセスできるタイミングで
- 無駄だな、と思うものができた時
- 思わず節約したいと思うものを買ってしまいそうになった時
- 欲しいな、というものができた時

## 使用技術
- Ruby 2.5.7
- Ruby on Rails 5.2.4
- MySQL 5.7.22
- Nginx
- Puma
- AWS
  -EC2
  -RDS
- Capistrano

## 機能一覧
- ユーザー登録、ログイン機能(devise)
- 画像アップロード（refile）
- いいね機能（Ajax）
- フォロー機能（Ajax）
- ページネーション機能(kaminari)
- 棒グラフ（chartkick）
- SEO対策（meta-tags）
  - SNSシェア機能

その他、詳細につきましては下記リンクからご確認ください。
<https://docs.google.com/spreadsheets/d/1Li0mqjAo9D6mE9aWFrYRnKpYbfO01lnlsq3yI6zvrg4/edit#gid=0>

## ER図
<img width="633" alt="スクリーンショット 2020-09-28 20 30 56" src="https://user-images.githubusercontent.com/66353006/94429094-c2515b80-01cc-11eb-8548-54d00ed78a0d.png">

## 設計書
[テーブル定義書／アプリケーション詳細設計書](https://docs.google.com/spreadsheets/d/1Au8eLIqfpZzAb036zpxLX5lO8sLtLPyZ3s2IwoE6vYg/edit#gid=1117064240)


## サイトテーマ
[The Habit Hub](https://www.thehabithub.com/)

## テーマを選んだ理由
- アプリの内容が作りたい内容に似ている
- 可視化イメージが想定と似ている

## 開発環境
- OS：Linux(CentOS)
- 言語：HTML,CSS,JavaScript,Ruby,SQL
- フレームワーク：Ruby on Rails
- JSライブラリ：jQuery、BootStrap
- 仮想環境：Vagrant,VirtualBox
