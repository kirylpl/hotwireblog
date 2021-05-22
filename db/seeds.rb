# frozen_string_literal: true
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#


5.times do |n|
  User.create(name: "User #{n}", email: "user#{n}@mail.com", password: 'password')
end

5.times do |n|
  Post.create(title: "Batman #{n}", body: 'Robin Good', user: User.first)
end

Post.all.each do |post|
  comment = Comment.create(user: User.last,
                       post: post,
                       body: "Comment for post '#{post.id}'" )

  5.times do |n|
    CommentReaction.create(
      user: User.find_by(email: "user#{rand(0..4)}@mail.com"),
      comment: comment,
      reaction: rand(0..2)
    )
  end
  
end
