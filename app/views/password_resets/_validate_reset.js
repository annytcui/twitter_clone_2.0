$("#reset-form").validate({
  //error place
  errorPlacement: function (error, element) {
    error.insertAfter(element);
    error.css("color", "red");
  },
  //adding rules
  rules: {
    // password is required
    "user[password]": {
      required: true,
      minlength: 8
    },
    // password_confirmation is required and is the same with password
    "user[password_confirmation]": {
      required: true,
      equalTo: "#user_password"
    }
  }
});
