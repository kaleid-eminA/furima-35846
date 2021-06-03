# テーブル設計

## users テーブル

| Column | Type | Options |
| ---| --- | --- |
|nickname|string|null: false|
|famiry_name|string|null: false|
|first_name|string|null: false|
|famiry_name_kana|string|null: false|
|first_name_kana|string|null: false|
|birth_date|date|null: false|
|email|string|null: false|
|encrypted_password|string|null: false|

### アソシエーション

- has_many :products dependent: :destroy
- has_many :orders dependent: :destroy



## products テーブル

|Column|Type|Options|
|---|---|---|
|user_id|references|foreign_key: true|
|name|string|null: false|
|description|text|null: false|
|condition_id|integer|null: false|
|shipping_cost_id|integer|null: false|
|prefecture_id|integer|null: false|
|days_to_ship_id|integer|null: false|
|categories_id|integer|null: false|
|price|integer|null: false|

### アソシエーション

- belongs_to :user


## destination テーブル

|Column|Type|Options|
|---|---|---|
|user_id|references|foreign_key: true|
|post_code|integer|null: false|
|prefecture_id|string|null: false|
|city|string|null: false|
|address1|string|null: false|
|address2|string||

### アソシエーション

- belongs_to :user


## orders テーブル

|Column|Type|Options|
|---|---|---|
|buyer_user_id|references|foreign_key: true|
|product_id|references|foreign_key: true|

###

- belongs_to :user