module PostsHelper
  
  #shorten content for title hover display
  def content_preview(post_content)
  
    preview = "#{post_content[0..75]}... *click for more*"
    return preview
  
  end
end
