# テーブル設計

## users テーブル

|Column             |Type      |Options                   |
|-------------------|----------|--------------------------|
|nickname           |string    |null: false               |
|email              |string    |null: false, unique: true |
|encrypted_password |string    |null: false               |

### Association
- has_many :main_issues

## main_issues テーブル

|Column            |Type       |Options                              |
|------------------|-----------|-------------------------------------|
|title             |text       |null: false                          |
|user              |references |null: false, foreign_key: true       |

### Association
- belongs_to :user
- has_many :sub_issues
- has_one :conclusion

## conclusions テーブル

|Column            |Type       |Options                              |
|------------------|-----------|-------------------------------------|
|content           |text       |null: false                          |
|main_issue        |references |null: false, foreign_key: true       |

### Association
- belongs_to :main_issue

## sub_issues テーブル

|Column         |Type          |Options                              |
|---------------|--------------|-------------------------------------|
|title          |text          |null: false                          |
|main_issue     |references    |null: false, foreign_key: true       |

### Association
- belongs_to :main_issue
- has_one :sub_conclusion
- has_one :hypothesis

## sub_conclusions テーブル

|Column         |Type          |Options                              |
|---------------|--------------|-------------------------------------|
|content        |text          |null: false                          |
|sub_issue      |references    |null: false, foreign_key: true       |

### Association
- belongs_to :sub_issue

## hypotheses テーブル

|Column         |Type          |Options                              |
|---------------|--------------|-------------------------------------|
|content        |text          |null: false                          |
|sub_issue      |references    |null: false, foreign_key: true       |

### Association
- belongs_to :sub_issue
- has_one :new_hypothesis
- has_many :informations

## new_hypotheses テーブル

|Column         |Type          |Options                              |
|---------------|--------------|-------------------------------------|
|content        |text          |null: false                          |
|hypothesis     |references    |null: false, foreign_key: true       |

### Association
- belongs_to :hypothesis

## informations テーブル

|Column           |Type         |Options                              |
|-----------------|-------------|-------------------------------------|
|content          |text         |null: false                          |
|hypothesis       |references   |null: false, foreign_key: true       |

### Association
belongs_to :hypothesis

### 要件定義
https://docs.google.com/spreadsheets/d/1S6Mc1NxH2WVdVjcs0riN7LocRKtGfZoRkyGMXqWwoLY/edit#gid=0