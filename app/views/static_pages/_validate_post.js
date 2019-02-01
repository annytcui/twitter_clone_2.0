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
