TOTAL_USER = 10
TOTAL_SAMPLE_USER = 10
TOTAL_VIDEO = 10
VIDEO_URLS = %w(
  https://www.youtube.com/watch?v=-pHkOXmJS2A&feature=emb_title
  https://www.youtube.com/watch?v=bn_KRzohcAo&feature=emb_title
  https://www.youtube.com/watch?v=25efj4hluVQ&feature=emb_title
  https://www.youtube.com/watch?v=MzCbEdtNbJ0
  https://www.youtube.com/watch?v=yPF94QiI2qk&list=LL&index=190
)



# Create Users
(1..TOTAL_USER).each do |idx|
  user_attrs = {
    email: "sample#{idx}@gmail.com",
    password: User::TEST_DEFAULT_PASSWORD
  }
  User.create(user_attrs).grant_user_access
end

# Create Videos
users = User.first(TOTAL_USER).sample(TOTAL_SAMPLE_USER)
(1..TOTAL_VIDEO).each do |_idx|
  current_user = users.sample
  params = {
    video_url: VIDEO_URLS.sample
  }
  Videos::CreateService.new(params, current_user).execute
end
