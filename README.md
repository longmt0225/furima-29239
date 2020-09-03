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
### Association
- has_many :items dependent: :destroy
- has_one :profile dependent: :destroy
- has_many :comments dependent: :destroy


## items テーブル
| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| name             | string     | null: false                    |
| introduction     | text       | null: false                    |
| price            | integer    | null: false                    |
| brand            | text       | null: false                    |
| items-condition  | integer    | null: false                    |
| postage_payer    | integer    | null: false                    |
| prefecture_code  | integer    | null: false                    |
| preparation_day  | integer    | null: false                    |
| category         | references | null: false                    |
| seller           | references | null: false                    |
| buyer            | references | null: false                    |
### Association
- belongs_to :user dependent: :destroy
- has_many :comments dependent: :destroy


## profiles テーブル
| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| first_name       | string     | null: false                    |
| family_name      | string     | null: false                    |
| first_name_kana  | string     | null: false                    |
| family_name_kana | string     | null: false                    |
| birth_day        | string     | null: false                    |
| introduction     | text       | null: false                    |
| user_id          | references | null: false                    |
### Association
- belongs_to :user dependent: :destroy


## comments テーブル
| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| comment          | text       | null: false                    |
| user             | references | null: false                    |
| item             | references | null: false                    |
### Association
- belongs_to :user dependent: :destroy
- belongs_to :item dependent: :destroy