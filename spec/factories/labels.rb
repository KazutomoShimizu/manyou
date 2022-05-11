FactoryBot.define do
  factory :label do
    name { "sample_label" }
  end
  factory :second_label, class: Label do
    name { "sample_label2" }
  end
  factory :third_label, class: Label do
    name { "sample_label3" }
  end
end
