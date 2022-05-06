require 'rails_helper'
RSpec.describe 'タスク管理機能', type: :system do
  describe '新規作成機能' do
    context 'タスクを新規作成した場合ステータスも登録できる' do
      it '作成したタスクが表示される' do
        task = FactoryBot.create(:task, title: 'sample1',content: 'sample1',status: '未着手')
        visit new_task_path
        fill_in 'task_title', with:'sample1'
        fill_in 'task_content', with:'sample1'
        select '未着手', from: 'task_status'
        click_on '登録する'
        expect(page).to have_content 'sample1'
      end
    end
  end

  describe '一覧表示機能' do
    context '一覧画面に遷移した場合' do
      it '作成済みのタスク一覧が表示される' do
        task = FactoryBot.create(:task, title: 'sample1')
        visit tasks_path
        expect(page).to have_content 'sample1'
      end
    end
    context 'タスクが作成日時の降順に並んでいる場合' do
      it '新しいタスクが一番上に表示される' do
        FactoryBot.create(:task)
        FactoryBot.create(:second_task)
        visit tasks_path
        task_list = all('.task_row')
        expect(task_list[0]).to have_content 'sample2'
      end
    end
  end

    describe "ソート機能" do
      let!(:task){ FactoryBot.create(:task) }
      let!(:task){ FactoryBot.create(:second_task) }
      before do
        visit tasks_path
      end
      context '終了期限でソートするボタンを押した場合' do
        it '終了期限が遅いタスクが一番上に表示される' do
         click_link "終了期限でソートする"
         task_title = all('.task_row')
         expect(task_title[0]).to have_content "sample2"
        end
      end
      context '優先順位でソートするボタンを押した場合' do
        it '優先順位が高いタスクが一番上に表示される' do
         click_link "優先度でソートする"
         task_title = all('.task_row')
         expect(task_title[0]).to have_content "sample1"
        end
      end
    end

    describe "検索機能" do
      let!(:task){ FactoryBot.create(:task) }
      let!(:task){ FactoryBot.create(:second_task) }
      before do
        visit tasks_path
      end
      context 'タイトルであいまい検索をした場合' do
        it "検索キーワードを含むタスクで絞り込まれる" do
          visit tasks_path
          fill_in 'inputcity', with: 'sample'
          click_on "検索"
          expect(page).to have_content 'sample2'
        end
      end
      context 'ステータス検索をした場合' do
        it "ステータスに完全一致するタスクが絞り込まれる" do
          visit tasks_path
          select '着手中', from: 'task[status]'
          click_on "検索"
          expect(page).to have_content 'sample2'
        end
      end
      context 'タイトルのあいまい検索とステータス検索をした場合' do
        it "検索キーワードをタイトルに含み、かつステータスに完全一致するタスク絞り込まれる" do
          visit tasks_path
          fill_in 'inputcity', with: 'sample'
          select '着手中', from: 'task[status]'
          click_on "検索"
          expect(page).to have_content 'sample2'
        end
      end
    end

      describe '詳細表示機能' do
         context '任意のタスク詳細画面に遷移した場合' do
           it '該当タスクの内容が表示される' do
             task = FactoryBot.create(:task, title: 'sample1',content: 'sample1')
             visit task_path(task.id)
             expect(page).to have_content 'sample1'
           end
         end
      end
    end
