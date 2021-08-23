# テーブル設計

## users テーブル

|Column             |Type      |Options                   |
|-------------------|----------|--------------------------|
|nickname           |string    |null: false               |
|email              |string    |null: false, unique: true |
|encrypted_password |string    |null: false               |

### Association
- has_many :user_main_issues
- has_many :main_issues, through: :user_main_issues


## user_main_issues テーブル

|Column             |Type      |Options                   |
|-------------------|----------|--------------------------|
|user_id            |string    |null: false               |
|main_issue_id      |string    |null: false, unique: true |

### Association
- belongs_to :user
- belongs_to :main_issue


## main_issues テーブル

|Column            |Type       |Options                              |
|------------------|-----------|-------------------------------------|
|title             |text       |null: false                          |
|user              |references |null: false, foreign_key: true       |

### Association
- has_many :user_main_issues
- has_many :main_issues, through: :user_main_issues
- has_many :sub_issues
- has_one :conclusions


## sub_issues テーブル

|Column         |Type          |Options                              |
|---------------|--------------|-------------------------------------|
|title          |text          |null: false                          |
|hypothesis     |text          |                                     |
|new_hypothesis |text          |                                     |
|sub_conclusion |text          |                                     |
|main_issue     |references    |null: false, foreign_key: true       |

### Association
- belongs_to :main_issue
- has_many :informations


## informations テーブル

|Column           |Type         |Options                              |
|-----------------|-------------|-------------------------------------|
|content          |text         |null: false                          |
|sub_issue        |references   |null: false, foreign_key: true       |

### Association
belongs_to :sub_issue


## conclusions テーブル

|Column            |Type       |Options                              |
|------------------|-----------|-------------------------------------|
|title             |text       |null: false                          |
|main_issue        |references |null: false, foreign_key: true       |

### Association
- belongs_to :main_issue