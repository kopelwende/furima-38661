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

| Column                | Type   | Options     |
| --------------------- | ------ | ----------- |
| nickname              | string | null: false |
| email                 | string | null: false |
| encrypted_password    | string | null: false |
| password_confirmation | string | null: false |
| last_name             | string | null: false |
| first_name            | string | null: false |
| last_name_kana        | string | null: false |
| first_name_kane       | string | null: false |
| birth_day             | date   | null: false |

### Association
- has_many :items
- has_many :orders



## items テーブル

| Column                | Type       | Options     |
| --------------------- | -----------| ------------|
| item_name             | string     | null: false |
| explanation           | text       | null: false |
| category_id           | integer    | null: false |
| item_status_id        | integer    | null: false |
| shipping_charges_id   | integer    | null: false |
| region_of_origin_id   | integer    | null: false |
| estimated_shipping_id | integer    | null: false |
| price                 | integer    | null: false |
| user                  | references | null: false |

### Association
- belongs_to :user 
- has_one :order



## addresses テーブル

| Column             | Type       | Options                      |
| ------------------ | ---------- | ---------------------------- |
| post_code          | string     | null: false                  |
| prefectures        | integer    | null: false                  |
| municipality       | string     | null: false                  |
| address            | string     | null: false                  |
| building           | string     |                              |
| phone_number       | string     | null: false                  |
| order              | references | null: false ,foreign_key:true|

### Association
- belongs_to :order



## orders テーブル

| Column             | Type       | Options                      |
| ------------------ | -----------| -----------------------------|
| user               | references | null: false ,foreign_key:true|
| item               | references | null: false ,foreign_key:true|

### Association
- belongs_to :user
- belongs_to :item
- has_one :address
