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

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| nickname           | string | null: false |
| email              | string | null: false, /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i: true|
| encrypted_password | string | null: false, /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i: true|
| last_name          | string | null: false, /\A[ぁ-んァ-ン一-龥]/: true |
| first_name         | string | null: false, /\A[ぁ-んァ-ン一-龥]/: true |
| last_name_kana     | string | null: false, /\A[ァ-ヶー－]+\z/: true |
| first_name_kane    | string | null: false, /\A[ァ-ヶー－]+\z/: true |
| birth_year         | string | null: false |
| birth_month        | string | null: false |
| birth_day          | string | null: false |


## items テーブル

| Column             | Type       | Options     |
| ------------------ | -----------| ----------- |
| item_name          | string     | null: false |
| explanation        | text       | null: false |
| category           | string     | null: false |
| item_status        | string     | null: false |
| shipping_charges   | string     | null: false |
| region_of_origin   | string     | null: false |
| price              | string     | null: false, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9,999,999 } |
| image              | string     | null: false |
| user               | references | null: false |
| buyer              | references | null: false |



## buyers テーブル

| Column             | Type       | Options     |
| ------------------ | ---------- | ----------- |
| post_code          | string     | null: false, /\A\d{3}[-]\d{4}\z/ |
| Prefectures        | string     | null: false |
| Municipality       | string     | null: false |
| address            | string     | null: false |
| building           | string     |             |
| phone_number       | string     | null: false, /\A[0-9]+\z/ |
| items              | references | null: false |
| user               | references | null: false |


## comments テーブル

| Column             | Type       | Options     |
| ------------------ | -----------| ----------- |
| comment            | string     | null: false |
| user               | references | null: false |
| item               | references | null: false |



