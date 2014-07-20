"use strict";
$(document).ready(function(){
    
    $('#sub-cat').change(function(){

        if($('#category option:selected').text() == "Entertainment" && $('#sub-cat option:selected').text() == "Movies" )
        {
            $("#main_div").show();
        }
        else if(('#category option:selected').text() == "Politics")
        {
             $("#main_div").text('Hold your horses.Coming soon');
             $("#main_div").show();
            
        }
        
});
    
});