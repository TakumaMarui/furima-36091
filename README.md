# テーブル設計

## users テーブル

| Column              | Type   | Options                   |
| ------------------- | ------ | ------------------------- |
| nickname            | string | null: false               |
| email               | string | null: false, unique :true |
| encrypted_password  | string | null: false               |
| family_name         | string | null: false               |
| first_name          | string | null: false               |
| family_name_reading | string | null: false               |
| first_name_reading  | string | null: false               |
| birthday            | date   | null: false               |


### Association

- has_many :items
- has_many :purchases

## items テーブル

| Column           | Type       | Options           |
| ---------------- | ---------- | ----------------- |
| name             | string     | null: false       |
| description      | text       | null: false       |
| category_id      | integer    | null: false       |
| condition_id     | integer    | null: false       |
| shipping_cost_id | integer    | null: false       |
| prefecture_id    | integer    | null: false       |
| shipping_days_id | integer    | null: false       |
| price            | integer    | null: false       |
| user             | references | foreign_key: true |

### Association

- belongs_to :user
- has_one :purchase

## purchases テーブル

| Column | Type       | Options           |
| ------ | ---------- | ----------------- |
| user   | references | foreign_key: true |
| item   | references | foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :residence

## residences テーブル

| Column        | Type        | Option            |
| ------------- | ----------- | ----------------- |
| postal_code   | string      | null: false       |
| prefecture_id | integer     | null: false       |
| city          | string      | null: false       |
| house_number  | string      | null: false       |
| building_name | string      |                   |
| phone_number  | string      | null: false       |
| purchase      | references  | foreign_key: true |

### Association

- belongs_to :purchase