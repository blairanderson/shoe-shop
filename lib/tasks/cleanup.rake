namespace :cleanup do
  namespace :users do
  end

  namespace :posts do
    desc 'delete posts without users'
    task without_users: [:environment] do
      Post.where(user_id: nil).update_all(status_enum: Post.statuses[:deleted])
    end
  end
end