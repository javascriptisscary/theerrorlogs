module RelationshipsHelper

  def order_posts(users)
    posts_array =[]
    
    users.each do |user|
      user.posts.each do |post|
        posts_array.push(post)
      
      end
    end
  
    return posts_array.sort! { |a,b| b.created_at <=> a.created_at }
  
  end



end