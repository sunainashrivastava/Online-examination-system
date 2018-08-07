// method to get user response.
$(document).on('click', 'input[name=option]', function () {
  value = $('[name="option"]:checked').val();
  user_answer = $("#user_answer").val(value);
});

// method to set timer for each question.
var time_spend = new Array();
var i;
$(document).ready(function(){
   i = 0;
  var val = $('.newTimer').data('time');
  val = parseInt(val);
  $(".timer").on('click', function autoRun(){  
    setTimeout(function(){
      document.getElementById("timeLeft").innerHTML = val;
      if(val == 0){
      $('.change').trigger('click');
        autoRun();
      }
      else
      {
        val = val - 1;
        autoRun();
      }
    }, 1000);

    $(".change").on('click', function(){
      time_spend[i] = parseInt(60-val);
      time_spend = time_spend.filter(item => item !== 0)
      val = 60;
      i = i + 1;
    });
  });
});

function results(){
  document.getElementById('timeSpend').innerHTML = time_spend;
}

// flash message
$(document).ready(function(){
  setTimeout(function(){
  $('.flash').fadeOut();
  }, 10000);
});

$(document).ready(function(){
  $("#take_test_type").on('click', function(){
    document.getElementById('type').innerHTML = "(Enter type in the following format 'Aptitude', 'Reasoning','Verbal')"
    $('span').fadeOut(20000);
  });

  $(".well").on('hover',function(){
    $(this).css("background-color", "#B0C4DE");
    }, function(){
    $(this).css("background-color", "powderblue");
  });

  $(function(){
    $('.link').hover(function(){
        $(this).animate({'z-index':'1','font-size':'35px'},50);
      },
      function(){
      $(this).animate({'z-index':'0','font-size':'1.35em'},50);
    });
});
});



// // method to get user response.
// $(document).on('click', 'input[name=option]', function () {
//   value = $('[name="option"]:checked').val();
//   user_answer = $("#user_answer").val(value);
// });

// // method to set timer for each question.
// var time_spend = new Array();
// var i;
// $(document).ready(function(){
//    i = 0;
//   var val = $('.newTimer').data('time');
//   val = parseInt(val);
//   $(".timer").on('click', function autoRun(){  
//     setTimeout(function(){
//       document.getElementById("timeLeft").innerHTML = val;
//       if(val == 0){
//       $('.change').trigger('click');
//         val = 60;
//         autoRun();
//       } 
//       else
//       {
//         val = val - 1;
//         autoRun();
//       }
//     }, 1000);
//   });

//   function run(){   
//     time_spend[i] = parseInt(60-val);
//     console.log(time_spend);
//     i = i + 1;
//     document.getElementById('timeSpend').innerHTML = time_spend;
//   }

//   $( document ).ajaxSuccess(function( event, xhr, settings ) {
//     $(".change").on('click', function(){
//       run();
//       val = 60;
//     });
//   });
// });

// function results(){
//   document.getElementById('timeSpend').innerHTML = time_spend;
// }
