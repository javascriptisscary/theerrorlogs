module UsersHelper
  
  #Remove time from post creation, leaving only date
  def remove_time(post)
    date = post.created_at.to_s.slice(0..9)
    return date
  end
  
end
