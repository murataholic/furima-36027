# テーブル設計

## users テーブル

| Column                      | Type   | Options     |
| --------------------------- | ------ | ----------- |
| email                       | string | null: false |
| encrypted_password          | string | null: false |
| nickname                    | string | null: false |
| first_name_zenkaku          | string | null: false |
| Last_name_zenkaku           | string | null: false |
| first_name_zenkaku_katakana | string | null: false |
| Last_name_zenkaku_katakana  | string | null: false |
| date_of_birth               | date   | null: false |

### Association

- has_many :items
- has_many :comments
- has_many :purchases

## items テーブル

| Column        | Type       | Options                        | 
| ------------- | ---------- | -------------------------------|
| name          | string     | null: false                    |
| description   | text       | null: false                    |
| category      | string     | null: false                    |
| condition     | string     | null: false                    |
| delivery_fee  | string     | null: false                    |
| ship_from     | string     | null: false                    |
| shipping_days | string     | null: false                    |
| price         | integer     | null: false                    |
| user          | references | null: false, foreign_key: true |


### Association

- belongs_to :user
- has_many :comments
- has_one :purchase

## comments テーブル

| Column | Type       | Options                        |
| -------| ---------- | ------------------------------ |
| text   | text       | null: false                    |
| user   | references | null: false, foreign_key: true |
| item   | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item

### purchases テーブル

| Column | Type       | Options                        |
| -------| ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| item   | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :shipping_addresses

### shipping_addresses テーブル

| Column                 | Type       | Options                        |
| -----------------------| ---------- | ------------------------------ |
| postal_code            | integer    | null: false                    |
| prefecture             | string     | null: false                    |
| city/ward/town/village | string     | null: false                    |
| house_number           | string     | null: false                    |
| building_name          | string     |                                |
| telephone_number       | integer    | null: false                    |
| card_number            | integer    | null: false                    |
| mm                     | integer    | null: false                    |
| yy                     | integer    | null: false                    |
| security_code          | integer    | null: false                    |
| purchase               | references | null: false, foreign_key: true |

### Association

- belongs_to :purchase