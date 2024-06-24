# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Admin.create!(
   name: 'admin',
   email: 'admin@admin',
   password: 'testtest'
)

users_attributes = [
      { name: "user_1",
        email: "user_1@test.com",
        password: "password",
        introduction: "xxxxxxxxx\nxxxxxx\nxxxxxxxxx",
        is_group_creator: true },
      { name: "user_2",
        email: "user_2@test.com",
        password: "password",
        introduction: "xxxxxxxxxxx" },
      { name: "user_3",
        email: "user_3@test.com",
        password: "password",
        introduction: "xxxxxxxxxxx" }
   ]


users_attributes.each.with_index(1) do |attributes, i|
   user = User.create!(attributes)
   user.profile_image.attach(io: File.open(Rails.root.join("db/sample_img/user#{i}.jpg")), filename: "user#{i}.jpg")
end

(4..11).each do |i|
   user = User.create!(
      name: "user_#{i}",
      email: "user_#{i}@test.com",
      password: "password",
      introduction: ("x" * rand(5..10) + "\n") * rand(2..4)
   )
   user.profile_image.attach(io: File.open(Rails.root.join("db/sample_img/user#{i}.jpg")), filename: "user#{i}.jpg")
end

posts_attributes = [
      {
         shop: "xx美容室",
         caption: "xxxxxxxx",
         user_id: 1,
         category: "美容",
         address: "東京都新宿区西新宿２丁目８−１"
      },
      {
         shop: "サロンoo",
         caption: "xxxxxxxxxx",
         user_id: 1,
         category: "美容",
         address: "東京都多摩市関戸６丁目１２−１"
      },
      {
         shop: "ビューティーoo",
         caption: "xxxxxxxxxxx",
         user_id: 1,
         category: "美容",
         address: ""
      },
      {
         shop: "xx美容室",
         caption: "xxxxxxxx",
         user_id: 2,
         category: "美容",
         address: "東京都新宿区西新宿２丁目８−１"
      },
      {
         shop: "サロンoo",
         caption: "xxxxxxxxxx",
         user_id: 2,
         category: "美容",
         address: "東京都多摩市関戸６丁目１２−１"
      },
      {
         shop: "ビューティーoo",
         caption: "xxxxxxxxxxx",
         user_id: 2,
         category: "美容",
         address: ""
      },
      {
         shop: "xx美容室",
         caption: "xxxxxxxx",
         user_id: 3,
         category: "美容",
         address: "東京都新宿区西新宿２丁目８−１"
      },
      {
         shop: "サロンoo",
         caption: "xxxxxxxxxx",
         user_id: 3,
         category: "美容",
         address: "東京都多摩市関戸６丁目１２−１"
      },
      {
         shop: "ビューティーoo",
         caption: "xxxxxxxxxxx",
         user_id: 3,
         category: "美容",
         address: ""
      }
   ]

posts_attributes.each.with_index(0) do |attributes, i|
   post = Post.create!(attributes)
   if i % 3 != 1
      index = rand(1..8)
      post.image.attach(io: File.open(Rails.root.join("db/sample_img/postimage#{index}.jpg")), filename: "postimage#{index}.jpg")
   end
end

(4...11).each do |i|
   n = rand(0..3)
   if n != 0
      Post.create!(
         shop: "shop#{i}",
         caption: "xxxxxxxxxxx",
         user_id: i,
         category: "美容",
         address: ""
      )
   end
end

user_ids = User.all.ids[0, 5]
post_ids = Post.all.ids[0, 10]

user_ids.each do |user_id|
   ids = post_ids.sample(3)
   ids.each do |post_id|
      Favorite.find_or_create_by!(user_id: user_id, post_id: post_id)
   end
end
