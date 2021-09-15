require 'rails_helper'

RSpec.describe 'サブイシューの登録', type: :system do
  before do
    @main_issue = FactoryBot.create(:main_issue)
    @sub_issue = FactoryBot.create(:sub_issue)
    @information = FactoryBot.create(:information)
  end
  context 'サブイシューが登録ができるとき' do
    it 'ログインしたユーザーはサブイシューページでサブイシューを投稿できる' do
      # ログインする
      visit new_user_session_path
      fill_in 'Email', with: @main_issue.user.email
      fill_in 'Password', with: @main_issue.user.password
      find('input[name="commit"]').click
      expect(current_path).to eq(root_path)
      # サブイシューページに遷移する
      visit main_issue_sub_issues_path(@main_issue)
      # １．枠組みを考えるフォームに情報を入力する
      fill_in 'sub_issue[title]', with: @sub_issue.title
      # 枠組みを登録すると、サブイシューモデルのカウントが1上がることを確認する
      expect { find('input[id="submit1"]').click }.to change { SubIssue.count }.by(1)
      # ２．初期仮説を立てるフォームに情報を入力する
      fill_in 'sub_issue[hypothesis]', with: @sub_issue.hypothesis
      find('input[id="submit2"]').click
      # ３．検証情報を集めるフォームに情報を入力する
      fill_in 'information[content]', with: @information.content
      # 検証情報を登録すると、インフォメーションモデルのカウントが1上がることを確認する
      expect { find('input[id="submit3"]').click }.to change { Information.count }.by(1)
      # ４．仮説を進化させるフォームに情報を入力する
      fill_in 'sub_issue[new_hypothesis]', with: @sub_issue.new_hypothesis
      find('input[id="submit4"]').click
      # ５．サブイシューに対する主張・結論フォームに情報を入力する
      fill_in 'sub_issue[sub_conclusion]', with: @sub_issue.sub_conclusion
      find('input[id="submit5"]').click
      # ６．イシューに対する主張・結論フォームに情報を入力する
      fill_in 'main_issue[conclusion]', with: @main_issue.conclusion
      find('input[id="submit6"]').click
      # トップページへ遷移したことを確認する
      expect(current_path).to eq(root_path)
      # サブイシューページに遷移する
      visit main_issue_sub_issues_path(@main_issue)
      # サブイシューページには先ほど登録したが「１．枠組みを考える」の内容が存在することを確認する
      expect(page).to have_content(@sub_issue.title)
      # サブイシューページには先ほど登録したが「２．初期仮説を立てる」の内容が存在することを確認する
      expect(page).to have_content(@sub_issue.hypothesis)
      # サブイシューページには先ほど登録したが「３．検証情報を集める」の内容が存在することを確認する
      expect(page).to have_content(@information.content)
      # サブイシューページには先ほど登録したが「４．仮説を進化させる」の内容が存在することを確認する
      expect(page).to have_content(@sub_issue.new_hypothesis)
      # サブイシューページには先ほど登録したが「５．サブイシューに対する主張・結論」の内容が存在することを確認する
      expect(page).to have_content(@sub_issue.sub_conclusion)
      # サブイシューページには先ほど登録したが「６．イシューに対する主張・結論」の内容が存在することを確認する
      expect(page).to have_content(@main_issue.conclusion)
    end
  end
  context 'ツイート投稿ができないとき' do
    it 'ログインしていないと新規投稿ページに遷移できない' do
      # トップページに遷移する
      visit root_path
      # 新規投稿ページへのボタンがないことを確認する
      expect(page).to have_no_content('イシューを特定する')
    end
  end
end
