# :smile: アプリ名
課題解決アプリ 
# :smile:アプリケーション概要
クリティカルシンキングという論理的思考法に基づき、<br>
課題解決に向けた適切なステップ踏み結論を導き出すことができる。

# :smile:URL
http://35.75.195.24/

# :smile: テスト用アカウント
ログイン機能等を実装した場合は、ログインに必要な情報を記述。またBasic認証等を設けている場合は、そのID/Passも記述すること。

# :smile: 利用方法
1.新規登録する or ログインする<br>
2.課題（イシュー）を設定する<br>
3.枠組みを考える<br>
4.初期仮説を立てる<br>
5.検証情報を集める<br>
6.仮説を進化させる<br>
7.サブイシューに対する主張・結論<br>
8.イシューに対する主張・結論<br>

# :smile: 制作背景(意図)
## 背景
私が過去にグロービス経営大学院へ通っており<br>
そこで課題解決に使う「クリティカルシンキング」という論理的思考法を勉強しておりました。<br>
その論理的思考法を誰でも簡単に使いこなせるサービスがあればいいなと感じてこのサービスを作りました。<br>

## ペルソナ
20代〜50代のビジネスマン

## ペルソナの課題とニーズ
以下のような課題に対して、<br>
論理的思考法のスキルを使いこなして課題解決に役立てたい。<br>

- 社内会議で、論理的に整理して物事を考えられない
- 課題に対してうまく結論がまとまらない
- 論点から脱線した結論を出してしまう

# :smile: 要件定義
[URL](https://docs.google.com/spreadsheets/d/1S6Mc1NxH2WVdVjcs0riN7LocRKtGfZoRkyGMXqWwoLY/edit#gid=0)
# :smile: 実装した機能についての画像やGIFおよびその説明
[ログイン機能](https://gyazo.com/bf32cbf8ae4f0b8fa2971b3063227760)

実装した機能について、それぞれどのような特徴があるのかを列挙する形で記述。画像はGyazoで、GIFはGyazoGIFで撮影すること。
# :smile: 実装予定の機能
- ピラミッドストラクチャー作成機能

# :smile: データベース設計
## ER図
![ER](https://user-images.githubusercontent.com/87056875/132993890-2f4d34e8-caf1-4c07-8293-9b4f2edc7528.png)
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
|conclusion        |text       |                                     |
|user              |references |null: false, foreign_key: true       |

### Association
- belongs_to :user
- has_many :sub_issues

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