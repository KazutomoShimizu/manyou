FactoryBot.define do
  factory :task, class: Task do
    title {'sample1'}
    content {'sample1'}
    end_date {Time.now}
    status {'未着手'}
    priority {'高'}

    after(:build) do |task|
      label = create(:label)
      task.labellings << build(:labelling, task: task, label: label)
    end
  end

  factory :second_task, class: Task do
    title {'sample2'}
    content {'sample2'}
    end_date {Time.now.since(3.days)}
    status {'着手中'}
    priority {'中'}

    after(:build) do |task|
      label = create(:second_label)
      task.labellings << build(:labelling, task: task, label: label)
    end
  end

  factory :third_task, class: Task do
    title {'sample3'}
    content {'sample3'}
    end_date {Time.now.since(5.days)}
    status {'完了'}
    priority {'低'}

    after(:build) do |task|
      label = create(:third_label)
      task.labellings << build(:labelling, task: task, label: label)
    end
  end
end
