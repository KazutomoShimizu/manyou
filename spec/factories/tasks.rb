FactoryBot.define do
  factory :task, class: Task do
    title {'sample1'}
    content {'sample1'}
  end
  factory :second_task, class: Task do
    title {'sample2'}
    content {'sample2'}
  end
end
