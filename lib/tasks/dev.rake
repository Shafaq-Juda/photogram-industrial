desc "Fill the database tables with some sample data"
task({ :sample_data => :environment }) do
  starting = Time.now
  p "Creating sample data"

 if Rails.env.development?
    FollowRequest.delete_all
    Comment.delete_all
    Like.delete_all
    Photo.delete_all
    User.delete_all
 end

  usernames = Array.new { Faker::Name.first_name}
  usernames << "alice"
  usernames << "bob"

  usernames.each do |username|
    User.create(
      email: "#{username}@example.com",
      username: username.downcase,
      password: "password",
      private: [true, false].sample,
    )
  end
  12.times do
    username = Faker::Name.first_name
    User.create(
      email: "#{username}@example.com",
      username: username.downcase,
      password: "password",
      private: [true, false].sample,
    )
  end

    users = User.all
    users.each do |user|
      rand(15).times do
        photo = user.own_photos.create(
          caption: Faker::Quote.jack_handey,
          image: "https://robohash.org/#{rand(9999)}"
        )
  
        user.followers.each do |follower|
          if rand < 0.5 && !photo.fans.include?(follower)
            photo.fans << follower
          end
  
          if rand < 0.25
            photo.comments.create(
              body: Faker::Quote.jack_handey,
              author: follower
            )
          end
        end
      end
    end
    p "There are now #{User.count} users."
    p "There are now #{FollowRequest.count} follow requests."
    p "There are now #{Photo.count} photos."
    p "There are now #{Like.count} likes."
    p "There are now #{Comment.count} comments."
  end
