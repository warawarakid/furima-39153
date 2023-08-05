
# テーブル設計

## users テーブル

| Column             | Type   | Options                   |
| ------------------ | ------ |-------------------------- |
| nickname           | string | null: false               |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |
| first_name         | string | null: false               |
| last_name          | string | null: false               |
| first_name_kana    | string | null: false               |
| last_name_kana     | string | null: false               |
| birth_day          | date   | null: false               |

### Association

- has_many :items
- has_many :purchase_records
- has_one  :payment_method


## items テーブル

| Column             | Type      | Options                        |
| ------------------ | --------- |------------------------------- |
| name               | string    | null: false                    |
| description        | text      | null: false                    |
| category_id        | integer   | null: false                    |
| condition_id       | integer   | null: false                    |
| shipping_charge_id | integer   | null: false                    |
| shipping_area_id   | integer   | null: false                    |
| shipping_day_id    | integer   | null: false                    |
| price              | integer   | null: false                    |
| user_id            | reference | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to_active_hash :category
- belongs_to_active_hash :condition
- belongs_to_active_hash :shipping_charge
- belongs_to_active_hash :shipping_area
- belongs_to_active_hash :shipping_day
- has_one :purchase_record


## purchase records テーブル

| Column     | Type     | Options                        |
|------------|----------|------------------------------- |
| user_id    | integer  | null: false, foreign_key: true |
| item_id    | integer  | null: false, foreign_key: true |
| created_at | datetime | null: false                    |

### Association

- belongs_to :user
- belongs_to :item
- has_one    :shipping_address


## payment methods テーブル

| Column          | Type    | Options                        |
|-----------------|---------|------------------------------- |
| user_id         | integer | null: false, foreign_key: true |
| card_token      | string  | null: false                    |
| expiration_date | date    | null: false                    |

### Association

- belongs_to :user


## shipping addresses テーブル

| Column             | Type       | Options                        |
|--------------------|------------|--------------------------------|
| purchase_record_id | references | null: false, foreign_key: true |
| postal_code        | string     | null: false                    |
| prefecture         | string     | null: false                    |
| city               | string     | null: false                    |
| street_address     | string     | null: false                    |
| building_name      | string     |                                |
| phone_number       | string     | null: false                    |

#### Association
- belongs_to :purchase_record