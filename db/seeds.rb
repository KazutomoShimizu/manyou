User.create!(
  name: "Admin",
  email: "admin@admin.com",
  password: "111111",
  password_confirmation: "111111",
  admin: true)

10.times do |i|
  User.create!(
    name: "user#{i + 1}",
    email: "user#{i + 1}@user.com",
    password: "111111",
    password_confirmation: "111111",
    admin: false
  )
end

10.times do |i|
  end_date = DateTime.new(2022,5,rand(1..30))
  Task.create!(
    title: "sample#{i + 1}",
    content: "sample_content#{i + 1}",
    status: "着手中",
    end_date: end_date,
    priority: "低",
    user_id: 5
  )
end

10.times do |i|
  Label.create!(
  name: "label#{i + 1}")
end
