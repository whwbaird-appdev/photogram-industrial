task :sample_data do
  email = Faker::Internet.email
  p "My email is #{email}"
  12.times{
    user = User.new
    user.email = Faker::Internet.unique.email
    user.username = Faker::Name.unique.name
    user.encrypted_password = "password"
    user.created_at = Time.now
    user.updated_at = Time.now
    user.save
    p "#{user.username} is User #{user.id}"
  }

end