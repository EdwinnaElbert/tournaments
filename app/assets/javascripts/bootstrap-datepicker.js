//= require rails.validations

var BootstrapDatepicker=function() {
    return {
        init:function() {
            $("#m_datepicker_1, #m_datepicker_1_validate").datepicker( {
              todayHighlight: !0, orientation: "bottom left", autoclose: true, format: 'dd/mm/yyyy'
            }).on ( 'hide', function(e) {
              if ($(this).val().length == 0) {
                if (locale == 'ru') {
                  message = 'Дата начала не может быть пустой'
                } else {
                  message = 'Start datetime can\'t be blank'
                }
                form = $(this.form);
                label = form.find("label[for='survey_start_datetime']");
                $('#datepicker_1_message').remove();
                label.closest('.has_danger').find('.message').remove();
                label.closest('.has_danger').append("<label class='message' id='datepicker_1_message' style='color:red'>" + message + "</label>");
                $(this).attr('valid', false);
                $(this).data('changed', true);
                $(this).attr('data-validate', true);
                $('.submit_with_dp').click(function(event) { event.preventDefault(); });
              } else {
                $('#datepicker_1_message').remove();
                $(this).closest('.has_danger').find('.message').remove();
                $(this).removeData('valid');
                $(this).removeData('changed');
                $(this).removeAttr('data-validate');
              }
            }),
            $("#m_datepicker_1_modal").datepicker({ todayHighlight: !0, orientation: "bottom left", format: 'dd/mm/yyyy' }),
            $("#m_datepicker_2, #m_datepicker_2_validate").datepicker({ todayHighlight: !0, orientation: "bottom left", format: 'dd/mm/yyyy' }),
            $("#m_datepicker_2_modal").datepicker({ todayHighlight: !0, orientation: "bottom left", format: 'dd/mm/yyyy' })
        }
    }
}

();
jQuery(document).ready(function() {
    BootstrapDatepicker.init()
}

);
