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
  
  
  
  
  //place camera icon inside users#edit image tactfully by changing div size
    function camera_icon() {
      var image_width = $("#profile").width();
      var image_height  = $("#profile").height();
      
    
      console.log(image_width, image_height);
      
      $("#profile-edit-photo").width(image_width);
      $("#profile-edit-photo").height(image_height);
    }
    
    blog_images_responsive();
    //The load event is sent to an element when it and all sub-elements have been completely loaded
    ('#profile').load(camera_icon());
  
  
})