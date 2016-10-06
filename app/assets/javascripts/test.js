$(document).ready(function(){
  $(document).on('click','#test',function(){
  	var body_val = $('#article_body').val();
  	var article_title = $('#article_title').val();
  	
    $.ajax({
      type: 'POST',
      url: '/admin/articles/get_html_snippet' ,
      data: {body_val: body_val},
      success: function(response){
      	console.log(response);
        $('#article_body').val(response['fields']['html']);
        $('#article_title').val(article_title);
      }  
    });
  });	

});