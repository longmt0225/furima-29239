# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

# テーブル設計

## users テーブル
| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| nickname         | string     | null: false                    |
| email            | string     | null: false, uniqueness: true  |
| password         | string     | null: false, uniqueness: true  |
| family_name      | string     | null: false                    |
| first_name       | string     | null: false                    |
| family_name_kana | string     | null: false                    |
| first_name_kana  | string     | null: false                    |
| birth_date       | string     | null: false                    |
### Association
- has_many :items dependent: :destroy
- has_many :purchases dependent: :destroy


## items テーブル
| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| name             | string     | null: false                    |
| price            | integer    | null: false                    |
| description      | text       | null: false                    |
| user_id          | integer    | null: false                    |
| category_id      | integer    | null: false                    |
| postage_payer_id | integer    | null: false                    |
| prefecture_id    | integer    | null: false                    |
| handling_time_id | integer    | null: false                    |
### Association
- belongs_to :user dependent: :destroy
- has_one :purchase dependent: :destroy


## purchases テーブル
| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| item             | references | null: false, foreign_key: true |
| user             | references | null: false                    |
### Association
- belongs_to :user dependent: :destroy
- belongs_to :item dependent: :destroy
- has_one :address dependent: :destroy

