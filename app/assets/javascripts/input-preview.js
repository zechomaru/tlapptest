
  $(function(){
    $('#pictureInput').on('change', function(event){
      var files = event.target.files;
      var image = files[0];
      var reader = new FileReader();
      reader.onload = function(file){
        var img = new Image();
        // console.log(file);
        img.src = file.target.result;
        $('#target').html(img);
      }
      reader.readAsDataURL(image);
      // console,log(files);
    });
    $('#pictureInputHover').on('change', function(event){
      var files = event.target.files;
      var image = files[0];
      var reader = new FileReader();
      reader.onload = function(file){
        var img = new Image();
        // console.log(file);
        img.src = file.target.result;
        $('#targetHover').html(img);
      }
      reader.readAsDataURL(image);
      // console,log(files);
    });
  });
