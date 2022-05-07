FactoryBot.define do
  factory :task, class: Task do
    title {'sample1'}
    content {'sample1'}
    end_date {Time.now}
    status {'未着手'}
    priority {'高'}
  end

  factory :second_task, class: Task do
    title {'sample2'}
    content {'sample2'}
    end_date {Time.now.since(3.days)}
    status {'着手中'}
    priority {'中'}
  end

  factory :third_task, class: Task do
    title {'sample3'}
    content {'sample3'}
    end_date {Time.now.since(5.days)}
    status {'完了'}
    priority {'低'}
  end

end
