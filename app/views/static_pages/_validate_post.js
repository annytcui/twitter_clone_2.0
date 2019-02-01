$("#micropost-form").validate({
  //error place
  errorPlacement: function (error, element) {
    error.insertAfter(element);
    error.css("color", "red");
  },
  //adding rules
  rules: {
  // content is required with max of 140
    "micropost[content]":{
      required: true,
      maxlength: 140
    }
  }
});

// Add file upload size validation
$('#micropost_picture').bind('change', function() {
  var size_in_megabytes = this.files[0].size/1024/1024;
  if (size_in_megabytes > 5) {
    alert('Maximum file size is 5MB. Please choose a smaller file.');
  }
});
