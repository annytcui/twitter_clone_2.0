$("#signup-form").validate({
  //error place
  errorPlacement: function (error, element) {
    error.insertAfter(element);
    error.css({"color":"red", "background-color":"rgba(255, 255, 255, 0.6)"});
  },
  //adding rules
  rules: {
  // name is required with max of 50
    "user[name]":{
      required: true,
      maxlength: 50
    },
    // email is required with format
    "user[email]": {
      required: true,
      email: true
    },
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
