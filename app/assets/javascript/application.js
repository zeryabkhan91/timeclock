function toTime(seconds) {
  var date = new Date(null);
  date.setSeconds(seconds);
  return date.toISOString().substr(11, 8);
}

$(document).ready(function(){
  $('.datepicker').datepicker({
    clearBtn: true,
    format: "dd/mm/yyyy"
  });

  $("body").on('click', '#confirm', function(){
    console.log($('#token_id').val())
    if ($('#token_id').val().length > 0){
      $.ajax({
        url: '/workers/confirm_worker',
        type: 'GET',
        data: { 'token': $('#token_id').val() },
        success: (response) => {
          window.localStorage.setItem("worker_id", response.id);
          $('.confirm_selection').addClass('d-none')
          $('.timer_section').removeClass('d-none')

        },
        error: (response) => {
          console.log(response);
          return
        }
      });
    }
  });

  var delay = 1000;
  var interval = null;
  var time_in_seconds = 0;

  $("body").on('click', '#punch_in', function(){
    $('#countdown_clock').removeClass('d-none');

    interval = setInterval(function(){
      output = $('#output');
      time_in_seconds += (delay/1000.0);
      output_val = toTime(time_in_seconds);
      output.text(output_val);
    }, delay)
  });

  $("body").on("click", "#punch_out", function(){
    clearInterval(interval);
  });
})
