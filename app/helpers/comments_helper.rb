module CommentsHelper

  def comment_preview(comment_content)
  
    preview = "#{comment_content[0..25]}..."
    return preview
  
  end




end
