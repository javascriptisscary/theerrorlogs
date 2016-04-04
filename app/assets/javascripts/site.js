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
  
  
 
    function arrow_disappear() {
      var arrow = document.getElementById("arrow");
        
        arrow.style.opacity = "0";
    };
    
  
 
  
  
  
  //call the function when scrolled upon
    window.document.addEventListener("scroll", arrow_disappear);
 
    blog_images_responsive();
  
  //if user clicks in profile intro text-area, submit button appears
    document.getElementById("intro-form").addEventListener("mousedown", function() {
      var submit = document.getElementById("submit-intro");
      
      submit.style.display = "initial";
      this.style.backgroundColor= "white";
      
      
    
    });
      
      
});