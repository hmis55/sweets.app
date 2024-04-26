# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


#登録ユーザー名
山田太郎= User.find_or_create_by!(email: "ya@ya") do |user|
  user.name = "山田太郎"
  user.password = "111111"
end

佐藤次郎= User.find_or_create_by!(email: "sa@sa") do |user|
  user.name = "佐藤次郎"
  user.password = "222222"
end

鈴木一郎= User.find_or_create_by!(email: "su@su") do |user|
  user.name = "鈴木一郎"
  user.password = "333333"
end

田中太郎= User.find_or_create_by!(email: "ta@ta") do |user|
  user.name = "田中太郎"
  user.password = "444444"
end

木村太郎= User.find_or_create_by!(email: "ki@ki") do |user|
  user.name = "木村太郎"
  user.password = "555555"
end