#User.create!(
  #name: "マスターヨーダ",
  #email: "admin@gmail.com",
  #password: "123456",
  #password_confirmation: "123456",
  #admin: true

5.times do |i|
  Label.create!(
  name: "label#{i + 1}")
end
