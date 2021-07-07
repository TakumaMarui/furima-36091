# テーブル設計

## users テーブル

| Column              | Type    | Options                   |
| ------------------- | ------- | ------------------------- |
| nickname            | string  | null: false               |
| email               | string  | null: false, unique :true |
| encrypted_password  | string  | null: false               |
| family_name         | string  | null: false               |
| first_name          | string  | null: false               |
| family_name_reading | string  | null: false               |
| first_name_reading  | string  | null: false               |
| birthday_year_id    | integer | null: false               |
| birthday_month_id   | integer | null: false               |
| birthday_day_id     | integer | null: false               |

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
| user_id          | references | foreign_key: true |

### Association

- belongs_to :user
- has_one :purchase

## purchases テーブル

| Column  | Type       | Options           |
| ------- | ---------- | ----------------- |
| user_id | references | foreign_key: true |
| item_id | references | foreign_key: true |

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
| purchase_id   | references  | foreign_key: true |

### Association

- belongs_to :purchase