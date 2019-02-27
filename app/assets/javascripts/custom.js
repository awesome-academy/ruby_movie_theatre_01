$(document).ready(function(){
  $('.seat-pos').click(function(){ 
    var text = $(this).text();
    $(this).toggleClass("bg-blue");
    if ($("#seat-"+ $(this).attr("id")).text() == "") {
      $("#seat-"+ $(this).context.id).text(text + ", ");
    } else {
      $("#seat-"+ $(this).context.id).text("")
    }
  });
});
