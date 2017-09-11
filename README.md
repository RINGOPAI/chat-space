# README


## usersテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false, unique: true, add_index :users, :name|

### Association
- has_many :members
- has_many :groups, through: :members
- has_many :messages


## groupsテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false|

### Association
- has_many :members
- has_many :users, through: :members
- has_many :messages


## membersテーブル

|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false, foreign_key: true|
|group_id|integer|null: false, foreign_key: true|

### Association
- belongs_to :group
- belongs_to :user


## messagesテーブル

|Column|Type|Options|
|------|----|-------|
|body|text||
|image|text||
|group_id|int|null: false, foreign_key: true|
|user_id|int|null: false, foreign_key: true|

### Association
- belongs_to :member
- belongs_to :user

