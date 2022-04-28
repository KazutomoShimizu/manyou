require 'rails_helper'
RSpec.describe 'タスク管理機能', type: :system do
  describe '新規作成機能' do
    context 'タスクを新規作成した場合' do
      it '作成したタスクが表示される' do
        task = FactoryBot.create(:task, title: 'sample1',content: 'sample1')
        visit new_task_path
        fill_in 'task_title', with:'sample1'
        fill_in 'task_content', with:'sample1'
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

