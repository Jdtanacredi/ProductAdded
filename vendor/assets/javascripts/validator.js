$(document).ready(function(){
  function Validator(inputArray) {
    this.initialize = function() {
      validateThis = function() {
        var inputElement = this;
        switch (inputElement.type) {
          case 'email':
            var re = /[A-Z0-9._%+-]+@[A-Z0-9.-]+.[A-Z]{2,4}/igm;
            if(inputElement.value == "" || !re.test(inputElement.value)) {
              debugger;
              $(this).siblings('.emailAlert').text('Please enter a valid email address');
             } else {
              $(this).siblings().text('');
            }
            break;
          default:
            if(inputElement.value == "") {
              debugger;
              $(this).siblings('.emailAlert').text('This is a required field');
            } else {
              $(this).siblings().text('');
            }
        }
      };
      inputArray = $("." + inputArray);
      console.log(inputArray);
      inputArray.each(function(index){
          inputArray[index].onblur = validateThis;
      });
    };
    this.initialize();
    }
  var validate = new Validator('validateThis');
  $('.validateThis').after("<p class='emailAlert'></p>");
});

// Add validateThis class to input field needing validation.
