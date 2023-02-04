
# テーブル設計

## usersテーブル

| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| name     | string | null: false |
| email    | string | null: false |
| password | string | null: false |

### Association
- has_many :room_users
- has_many :rooms, through: room_users
- has_many :massages

## roomsテーブル

| Column | Type   | Options     |
| ------ | ------ | ----------- |
| name  | string | null: false |

### Association
- has_many :room_users
- has_many :users, through: room_users
- has_many :massages

## room_usersテーブル

| Column  | Type    | Options                        |
| ------- | ------- | ------------------------------ |
| user | references | null: false, foreign_key: true |
| room | references | null: false, foreign_key: true |

### Association

- belongs_to :room
- belongs_to :user

## messagesテーブル

| Column  | Type    | Options                        |
| ------- |  ------- | ------------------------------ |
| text    | string  |
| user | references | null: false, foreign_key: true |
| room | references | null: false, foreign_key: true |

### Association

- belongs_to :room
- belongs_to :user