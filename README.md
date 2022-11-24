# Find（アプリケーション名）

## アプリケーション概要
大学生が友人ができるきっかけとなるためのアプリケーションです。

## 主な利用方法
自分の大学の掲示板で
* スレッドを作り、一緒に授業を受ける友人を募集
* 誰かが作ったスレッドに対してコメント

## アプリケーションURL
* 54.178.162.27

## 構成図
* 構成図画像

## 使用技術
* Ruby3.1.2
* RubyOnRails6.1.7
* MySQL
* AWS
  * EC2
  * RDS
* Nginx
* Docker
* Bootstrap4.5
* FontAwesome

## ER図
* https://drive.google.com/file/d/1hornXhA59CYQkz7hL5tRyDDp6ZruAwC2/view?usp=sharing

## 主な機能一覧
* ユーザー登録・ログイン機能(devise)
* フォロー機能
* DM機能
* 投稿機能
* コメント機能
* ページネーション機能(kaminari)
* 検索機能

## ローカルでの動作確認
```
git clone git@github.com:yutomizuta/find.git
docker compose run --rm app bundle install
docker compose run --rm api rails db:create
docker compose run --rm api rails db:migrate
docker compose run --rm api rails webpacker:install
docker compose up 
## http://localhost:3000/で起動確認
```

## 追加予定機能
* ゲストログイン機能
* 管理者によるユーザー削除