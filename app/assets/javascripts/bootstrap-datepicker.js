var BootstrapDatepicker=function() {
    var t;
    t=false? {
        leftArrow: '<i class="la la-angle-right"></i>', rightArrow: '<i class="la la-angle-left"></i>'
    }
    : {
        leftArrow: '<i class="la la-angle-left"></i>', rightArrow: '<i class="la la-angle-right"></i>'
    }
    ;


    return {
        init:function() {
            $("#m_datepicker_1, #m_datepicker_1_validate").datepicker( {
              todayHighlight: !0, orientation: "bottom left", templates: t, onClose: function(){ $(this).focusout(); }
            }),
            $("#m_datepicker_1_modal").datepicker( {
              todayHighlight: !0, orientation: "bottom left", templates: t, onClose: function(){ $(this).focusout(); }
            }),
            $("#m_datepicker_2, #m_datepicker_2_validate").datepicker( {
              todayHighlight: !0, orientation: "bottom left", templates: t, onClose: function(){ $(this).focusout(); }
            }),
            $("#m_datepicker_2_modal").datepicker( {
              todayHighlight: !0, orientation: "bottom left", templates: t, onClose: function(){ $(this).focusout(); }
            })
        }
    }
}

();
jQuery(document).ready(function() {
    BootstrapDatepicker.init()
}

);
