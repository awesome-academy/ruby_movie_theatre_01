$(document).ready(function(){
  var seats = [];
  $('.seat-pos').click(function(){ 
    var text = $(this).text();
    $(this).toggleClass("bg-blue");
    if (seats.includes(text) == false) {
      if (parseInt($('#total').text()) >= 250000) {
        alert("Không thể chọn quá 5 ghế cho một lượt mua online.");
        $(this).removeClass("bg-blue");
        return;
      }
      seats.push(text);
      $("#seat-selected").text(seats.join());
      $('#total').text(seats.length * 50000);
    } else {
      var found = seats.indexOf(text);
      seats.splice(found, 1);
      $("#seat-selected").text(seats.join());
      $('#total').text(seats.length * 50000); 
    }
  });
  
  $(".continue").click(function(){
    var seats_del_spc = seats.map(str => str.replace(/\s/g, ''));
    var total = parseInt($('#total').text());
    $.ajax({
      url: $(this).data("url"),
      type: "GET",
      dataType: "script",
      data: {
        positions: seats_del_spc, total: total
      }
    });
  });

  $(document).on("click",".confirm",function() {
    $.ajax({
      url: $(this).data("url"),
      type: "POST",
      dataType: "script",
    });
  });

});
