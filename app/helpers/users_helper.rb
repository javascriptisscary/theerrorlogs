module UsersHelper
  
  #Remove time from post creation, leaving only date
  def remove_time(comment_or_post)
    date = comment_or_post.created_at.to_s.slice(0..9)
    return date
  end
  
end
