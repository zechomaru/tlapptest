$("document").ready(function(){
  service = $( "#selectedService" ).val();
  bundle = $( "#selectedBundle" ).val();
  if (service != 0) {
    $('#selectService').prop('checked', true);
    $("#selectedService").css('display', 'block');
  };
  if (bundle != 0) {
    $('#selectBundle').prop('checked', true);
    $("#selectedBundle").css('display', 'block');
  };
  $("#pageTitle").keyup(function() {
    var value = $(this).val().replace(/\s/g,"-").toLowerCase();
    $("#pageUrl").val(value);
  }).keyup();

  $( "#selectService" ).click(function() {
    $("#selectedBundle").css('display', 'none');
    $("#selectedService").css('display', 'block');
    $('#selectedBundle option:eq(0)').prop('selected', true);
  });
  $( "#selectBundle" ).click(function() {
    $("#selectedService").css('display', 'none');
    $("#selectedBundle").css('display', 'block');
    $('#selectedService option:eq(0)').prop('selected', true);

  });
});
