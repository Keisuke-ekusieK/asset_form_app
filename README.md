# README

## 1. アプリの概要
ユーザー間で月々の支出や保有資産ポートフォリオを共有し、お互いの資産形成のヒントにするアプリです。  
<img src="https://user-images.githubusercontent.com/68892662/106268949-282f1c00-626f-11eb-8d24-06ef1f5be366.png" width="500px">

https://portfolio.asset-formation-app.com  
メールアドレス：user@example.com  
パスワード：password

## 2. アプリケーションの機能一覧
1. 月の支出グラフ投稿・削除機能
2. 資産ポートフォリオ円グラフ登録・編集機能
3. 家族構成登録・編集機能
4. ユーザー検索機能
5. 投稿にいいねをつける機能
6. フォロー・アンフォロー機能
7. アイコン画像登録機能
8. フィード一覧機能
9. ユーザー・フォロー・フォロワー一覧機能
10. ページネーション機能
11. 管理者によるユーザー削除機能
12. フレンドリーフォワーディング機能

## 3. インフラ
本番環境：AWS（EC2, RDS, S3, ELB, ACM, Route53）  
サーバー：Nginx + Puma  
DB：PostgreSQL

## 4. 使用技術
1. グラフ描画にchartkick gem
2. Ajaxを利用した非同期処理(フォロー/アンフォロー・いいね)
3. BootstrapのプルダウンメニューとCollapseによる表示切替
4. fontawesome
---
