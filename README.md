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
| last_name          | string | null: false |
| first_name         | string | null: false |
| last_name_kana     | string | null: false |
| first_name_kane    | string | null: false |
| birth_day          | date   | null: false |

### Association
- has_many :items
- has_many :addresses
- has_many :oders



## items テーブル

| Column             | Type       | Options     |
| ------------------ | -----------| ----------- |
| item_name          | string     | null: false |
| explanation        | text       | null: false |
| category           | string     | null: false |
| item_status        | string     | null: false |
| shipping_charges   | string     | null: false |
| region_of_origin   | string     | null: false |
| Estimated_shipping | string     | null: false |
| price              | int        | null: false |
| user               | references | null: false |

### Association
- belongs_to :user 
- has_one :address
- has_one :oder



## addresses テーブル

| Column             | Type       | Options     |
| ------------------ | ---------- | ----------- |
| post_code          | string     | null: false |
| prefectures        | string     | null: false |
| municipality       | string     | null: false |
| address            | string     | null: false |
| building           | string     |             |
| item               | references | null: false |
| user               | references | null: false |

### Association
- belongs_to :user
- belongs_to :items



## oders テーブル

| Column             | Type       | Options     |
| ------------------ | -----------| ----------- |
| phone_number       | string     | null: false |    
| user               | references | null: false |
| item               | references | null: false |

### Association
- belongs_to :user
- belongd_to :item
