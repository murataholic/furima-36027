# テーブル設計

## users テーブル

| Column                  | Type   | Options                   |
| ------------------------| ------ | ------------------------- |
| email                   | string | null: false, unique: true |
| encrypted_password      | string | null: false               |
| nickname                | string | null: false               |
| first_name_zenkaku      | string | null: false               |
| last_name_zenkaku       | string | null: false               |
| f_name_zenkaku_katakana | string | null: false               |
| l_name_zenkaku_katakana | string | null: false               |
| date_of_birth           | date   | null: false               |

### Association

- has_many :items
<!-- - has_many :comments -->
- has_many :purchases

## items テーブル

| Column          | Type       | Options                        | 
| --------------- | ---------- | -------------------------------|
| name            | string     | null: false                    |
| description     | text       | null: false                    |
| category_id     | integer    | null: false                    |
| condition_id    | integer    | null: false                    |
| delivery_fee_id | integer    | null: false                    |
| prefecture_id   | integer    | null: false                    |
| shipping_day_id | integer    | null: false                    |
| price           | integer    | null: false                    |
| user            | references | null: false, foreign_key: true |


### Association

- belongs_to :user
<!-- - has_many :comments -->
- has_one :purchase

<!-- ## comments テーブル

| Column | Type       | Options                        |
| -------| ---------- | ------------------------------ |
| text   | text       | null: false                    |
| user   | references | null: false, foreign_key: true |
| item   | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item -->

### purchases テーブル

| Column | Type       | Options                        |
| -------| ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| item   | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :shipping_address

### shipping_addresses テーブル

| Column                 | Type       | Options                        |
| -----------------------| ---------- | ------------------------------ |
| postal_code            | string     | null: false                    |
| prefecture_id          | integer    | null: false                    |
| city_ward_town_village | string     | null: false                    |
| house_number           | string     | null: false                    |
| building_name          | string     |                                |
| telephone_number       | string     | null: false                    |
| purchase               | references | null: false, foreign_key: true |

### Association

- belongs_to :purchase