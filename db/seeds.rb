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


#ユーザーの投稿
#山田太郎
Post.find_or_create_by!(title: "いちごのケーキ", user: 山田太郎) do |post|
  post.body = "ケーキを作りました。"
  post.image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/app/assets/images/cake.jpg"), filename:"cake.jpg")
end

Post.find_or_create_by!(title: "ドーナツ", user: 山田太郎) do |post|
  post.body = "オールドファッションをつくりました。"
  post.image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/app/assets/images/donut.jpg"), filename:"donut.jpg")
end

#佐藤次郎
Post.find_or_create_by!(title: "ドーナツ", user: 佐藤次郎) do |post|
  post.body = "オールドファッションをつくりました。"
  post.image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/app/assets/images/donut.jpg"), filename:"donut.jpg")
end

Post.find_or_create_by!(title: "ブッシュドノエル", user: 佐藤次郎) do |post|
  post.body = "クリスマスにブッシュドノエルを作りました。"
  post.image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/app/assets/images/noel.jpg"), filename:"noel.jpg")
end

#鈴木一郎
Post.find_or_create_by!(title: "ブッシュドノエル", user: 鈴木一郎) do |post|
  post.body = "クリスマスにブッシュドノエルを作りました。"
  post.image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/app/assets/images/noel.jpg"), filename:"noel.jpg")
end

Post.find_or_create_by!(title: "たまごプリン", user: 鈴木一郎) do |post|
  post.body = "たまごプリンを作りました。"
  post.image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/app/assets/images/purine.jpg"), filename:"purine.jpg")
end

#田中太郎
Post.find_or_create_by!(title: "ロールパン", user: 田中太郎) do |post|
  post.body = "ロールパンを作りました。"
  post.image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/app/assets/images/raulpan.jpg"), filename:"raulpan.jpg")
end

Post.find_or_create_by!(title: "シュークリーム", user: 田中太郎) do |post|
  post.body = "シュークリームを生地から作りました。"
  post.image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/app/assets/images/shucream.jpg"), filename:"shucream.jpg")
end

Post.find_or_create_by!(title: "チョコケーキ", user: 田中太郎) do |post|
  post.body = "チョコケーキを作りました。"
  post.image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/app/assets/images/chocola.JPG"), filename:"chocola.JPG")
end

#木村太郎
Post.find_or_create_by!(title: "ケーキ", user: 木村太郎) do |post|
  post.body = "ケーキを作りました。"
  post.image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/app/assets/images/cake.jpg"), filename:"cake.jpg")
end
