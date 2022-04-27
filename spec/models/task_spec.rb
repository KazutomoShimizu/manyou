require 'rails_helper'
  describe 'タスクモデル機能', type: :model do
    context 'タスクのタイトルが空の場合' do
      it 'バリデーションにひっかる' do
        task = Task.new(title: nil, content: 'sample1')
        expect(task).not_to be_valid
      end
    end
    scontext 'タスクの詳細が空の場合' do
      it 'バリデーションにひっかかる' do
        task = Task.new(title: 'sample1', content: nil)
        expect(task).not_to be_valid
      end
    end
    context 'タスクのタイトルと詳細に内容が記載されている場合' do
      it 'バリデーションが通る' do
        task = Task.new(title: 'sample1', content: 'sample1')
        expect(task).to be_valid
      end
    end
  end

  RSpec.describe Task, type: :model do
    pending "add some examples to (or delete) #{__FILE__}"
  end
