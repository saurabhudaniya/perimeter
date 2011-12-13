// This is a manifest file that'll be compiled into including all the files listed below.
// Add new JavaScript/Coffee code in separate files in this directory and they'll automatically
// be included in the compiled file accessible from http://example.com/assets/application.js
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
//= require jquery
//= require jquery_ujs
//= require_tree .
 $(document).ready(
  function(){
    setInterval(function(){
      $('#chat').load('chats/show');
    }, 5000);
  });

 $(".link").live('hover', function() {
       var e = $(this)
       e.focus();
    
    });

   $(".login_button").live('click',function(){
      
       $(".login_div").slideUp("slow")
       $(".hidden_div").show("slow")
   });
   $(".signup_button").live('click',function(){

       $(".login_div").show("slow")
       $(".hidden_div").slideUp("slow")
   });


   $(".show").live('click',function(){
         $(".show").slideUp("slow")
       $(".hidden_div").slideDown("slow")
       $(".hidden_password_div").slideUp("slow")
   });
   $(".hide").live('click',function(){

       $(".hidden_div").slideUp("slow")
       $(".show").show("slow")
       $(".show_password").show("slow")
   });



   $(".show_password").live('click',function(){
         $(".show_password").slideUp("slow")
       $(".hidden_password_div").slideDown("slow")
       $(".hidden_div").slideUp("slow")
       $(".show").show("slow")
   });
   
   $(".hide_password_div").live('click',function(){

       $(".hidden_password_div").slideUp("slow")
       $(".show_password").show("slow")
       $(".hide").show("slow")
   });

    $("#comments").find("#new_comment").last().show("slow");
    $(".new_comment").slideDown("slow")



