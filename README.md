# テーブル設計

## users テーブル

| Column | Type | Options |
| ---| --- | --- |
|nickname|string|null: false|
|famiry_name|string|null: false|
|first_name|string|null: false|
|famiry_name_kana|string|null: false|
|first_name_kana|string|null: false|
|birth_year|string|null: false|
|birth_month|string|null: false|
|birth_day|string|null_ false|
|email|string|null: false|
|encrypted_password|string|null: false|

### アソシエーション

- has_many :products dependent: :destroy
- has_many :credits dependent: :destroy
- has_many :destinations dependent: :destroy


## products テーブル

|Column|Type|Options|
|---|---|---|
|user_id|references|foreign_key: true|
|name|string|null: false|
|description|string|null: false|
|condition|string|null: false|
|shipping_cost|string|null: false|
|shipping_area|string|null: false|
|days_to_ship|integer|null: false|
|price|integer|null: false|

### アソシエーション

- belongs_to :user


## destination テーブル

|Column|Type|Options|
|---|---|---|
|user_id|references|foreign_key: true|
|name|string|null: false|
|mail|string|null: false|
|post_code|integer|null: false|
|prefecture|string|null: false|
|city|string|null: false|
|address1|string|null: false|
|address2|string||

### アソシエーション

- belongs_to :user


## credit テーブル

|Column|Type|Options|
|---|---|---|
|user_id|references|foreign_key: true|
|card_number|integer|null: false|
|expiration_date|integer|null: false|

###

- belongs_to :user