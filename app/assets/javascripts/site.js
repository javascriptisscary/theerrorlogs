 $(document).on('page:change', function(){
    
    //place camera icon inside users#edit image tactfully by changing div size
    function camera_icon() {
      var image_width = $("#profile").width();
      var image_height  = $("#profile").height();
      
    
      console.log(image_width, image_height);
      
      $("#profile-edit-photo").width(image_width);
      $("#profile-edit-photo").height(image_height);
    }

    
    camera_icon();
    
    //bootstrap tooltip
    $('[data-toggle="tooltip"]').tooltip(); 
    
})