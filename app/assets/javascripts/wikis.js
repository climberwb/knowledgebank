
var ready_wiki = function() {
    $("#wiki_submit").on('click', function(e) {
         $('div.alert.alert-danger').remove();
         if($('#wiki_title').val() == ""){
               
                e.preventDefault();
             
             $('ul.nav.nav-tabs').after("<div class='alert alert-danger'> Wiki needs a title!");
                alert("hello");
              }
           });

          $('#collaboration_user_name').on('keyup', function() { 
       
        text = $(this).val();
       if(text.length > 1)
       {
          $.ajax({ url: "/collaborations?collaboration="+text, 
            beforeSend: function( xhr ) { 
              xhr.overrideMimeType( "text/plain; charset=x-user-defined" ); 
            } 
          }).done(function( data ) {
            $("#user_data ul li").remove();
            eval(data);
            $(' .list-group-item').click(function() {
              $('#collaboration_user_name').val($(this).text().split(",")[0]);
              $('#collaboration_user_id').val($(this).val());
            });
          });
        };
   });
};

$(document).ready(ready_wiki);
$(document).on('page:load', ready_wiki);

