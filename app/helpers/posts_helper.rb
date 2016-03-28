module PostsHelper
  
  #shorten content for title hover display
  def content_preview(post_content)
  
    preview = "#{post_content[0..75]}... *click for more*"
    return preview
  
  end

  #erase time off of created_at
  def no_time(date_time)
    date_time = date_time.to_s
    month = date_time.slice(5..6)
    date = date_time.slice(8..9)
    year = date_time.slice(0..3)
    
    return "#{month}/#{date}/#{year}"
    
  end
    

end
