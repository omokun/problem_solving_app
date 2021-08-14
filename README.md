# テーブル設計

## users テーブル

|Column             |Type      |Options                   |
|-------------------|----------|--------------------------|
|nickname           |string    |null: false               |
|email              |string    |null: false, unique: true |
|encrypted_password |string    |null: false               |
|last_name          |string    |null: false               |
|first_name         |string    |null: false               |
|last_name_kana     |string    |null: false               |
|first_name_kana    |string    |null: false               |

### Association
- has_many :main_issues

## main_issues テーブル

|Column            |Type       |Options                              |
|------------------|-----------|-------------------------------------|
|title             |text       |null: false                          |
|conclusion        |text       |null: false                          |
|user              |references |null: false, foreign_key: true       |

### Association
- belongs_to :user
- has_many :sub_issues

## sub_issues テーブル

|Column         |Type          |Options                              |
|---------------|--------------|-------------------------------------|
|title          |text          |null: false                          |
|hypothesis     |text          |null: false                          |
|new_hypothesis |text          |null: false                          |
|sub_conclusion |text          |null: false                          |
|main_issues    |references    |null: false, foreign_key: true       |


### Association
- belongs_to :main_issue
- has_many :informations

## informations テーブル

|Column           |Type         |Options                              |
|-----------------|-------------|-------------------------------------|
|content          |text         |null: false                          |
|purchase_record  |references   |null: false, foreign_key: true       |

### Association
belongs_to :sub_issues