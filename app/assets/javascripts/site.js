$(document).on('page:change', function(){
    
   
    
    
    
    //bootstrap tooltip
  $('[data-toggle="tooltip"]').tooltip();
    
    
    
    //make images displaying from user-created blog posts have class "img-responsive" 
    
  function blog_images_responsive() {
      
    //grab all displaying posts 
    var posts = document.getElementsByClassName("post");
    
   
    //grab separate images from each post
    for (var i =0; i<posts.length; i++) {
      
      var images= posts[i].getElementsByTagName("img");
       
      for (var x =0; x<images.length; x++) {
        
        if (typeof images[x] !== "undefined") {
        
          images[x].classList.add("img-responsive");
        }
        
        else {
         continue;
        }
      
      }
     
      
    
    }
   
  }; //end blog_images_responsive
  
  blog_images_responsive();
  
  
})