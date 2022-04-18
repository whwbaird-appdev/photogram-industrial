task sample_data: :environment do
  p "Creating users..."

  usernames = Array.new { Faker::Name.first_name }
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
  p "#{User.count} users have been created"
end

task sample_follow: :environment do
  p "Following..."
  users = User.all
  users.each do |first_user|
    users.each do |second_user|
      if rand<0.75
        first_user.sent_follow_requests.create(
          recipient: second_user,
          status: FollowRequest.statuses.keys.sample
        )
      end
      if rand<0.75
        second_user.sent_follow_requests.create(
          recipient: first_user,
          status: FollowRequest.statuses.keys.sample
        )
      end
    end
  end
  p "#{FollowRequest.count} follow requests have been sent."
end

task sample_content: :environment do
  p "Creating content..."
  users=User.all
  users.each do |user|
    rand(10).times do
      photo = user.own_photos.create(
        caption: "#{Faker::Quotes::Shakespeare}",
        image: "https://robohash.org/#{rand(9999)}"
      )
      user.followers.each do |follower|
        if rand<0.5
          photo.fans << follower
        end
        if rand<0.25
          photo.comments.create(
            body: Faker::Quotes::Chiquito.joke,
            author: follower
          )
        end
      end
    end
  end
  p "#{Photo.count} photos have been created."
  p "#{Like.count} likes have been sent."
  p "#{Comment.count} comments have been made."
end

task destroy_users: :environment do
  if Rails.env.development?
    FollowRequest.destroy_all
    User.destroy_all
    p "Users destroyed."
  else
    p "No u"
  end
end

task destroy_content: :environment do
  if Rails.env.development?
    Like.destroy_all
    Comment.destroy_all
    Photo.destroy_all
    p "Content destroyed"
  else
    p "No u"
  end
end