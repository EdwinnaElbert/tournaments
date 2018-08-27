// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require rails-ujs
//= require activestorage
//= require_tree .
//= require vendors.bundle
//= require scripts.bundle
//= require bootstrap-datepicker

function add_multiple_choice(){
  var uuid = generateUUID();
  var uuid2 = generateUUID();
  var add_option_link = "";
  var remove_option_link = "";
  var remove_question_link = "";
  var count = $("#questions_body .col-lg-12").length + 1;
  var html = "<div class='col-lg-12 question_" + uuid + "'>\
                <h5 class='m--font-primary'>\
                  Question #\
                  <span>" + count + "<span>\
                  (Only answer)\
                </h5>\
                <input class='form-control m-input' required='required' type='text' name='survey[survey_questions_attributes][" + uuid + "][question]' id='survey_question_title_" + count + "' data-validate='true'>\
                <input type='hidden' name='survey[survey_questions_attributes][" + uuid + "][question_type]' value=1>\
                <input type='hidden' name='survey[survey_questions_attributes][" + uuid + "][weight]' value=" + count + ">\
                <!-- <input class='delete_" + uuid + "' type='hidden' name='survey[survey_questions_attributes][" + uuid + "][_delete]' value=0> -->\
                <div class='answers col-lg-10' id='answers_" + uuid + "'>\
                  <h6 class='m--font-brand'>Answers</h6>\
                  <div class='form-group m-form__group row align-items-center'>\
                    <div class='col-md-10'>\
                      <div>\
                        <div>\
                          <input class='form-control m-input' required='required' type='text' name='survey[survey_questions_attributes][" + uuid + "][survey_question_answers_attributes][" + uuid2 + "][answer]' id='survey_question_answer_title_" + count + "' data-validate='true'>\
                          <input  class='weight_" + uuid2 + "' type='hidden' name='survey[survey_questions_attributes][" + uuid + "][survey_question_answers_attributes][" + uuid2 + "][weight]' value=" + 1 + ">\
                        </div>\
                      </div>\
                    </div>\
                  </div>\
                </div>\
                <div class='m-form__group form-group row'>\
                  <div class='col-lg-10'>\
                    <a href='js:' onclick='add_multiple_option(\"" + uuid + "\");' class='m-link m-link--state m-link--success'>Add option</a>&nbsp;&nbsp;\
                    <a href='js:' onclick='remove_question(\"" + uuid + "\");' class='m-link m-link--state m-link--danger'>Remove Question</a>\
                  </div>\
                </div>\
                <div class='m-form__seperator m-form__seperator--dashed m-form__seperator--space'></div>\
              </div>"
  $("#questions_body").append(html);
}

function add_checkboxes_choice(){
  var uuid = generateUUID();
  var uuid2 = generateUUID();
  var add_option_link = "";
  var remove_option_link = "";
  var remove_question_link = "";
  var count = $("#questions_body .col-lg-12").length + 1;
  var html = "<div class='col-lg-12 question_" + uuid + "'>\
                <h5 class='m--font-primary'>\
                  Question #\
                  <span>" + count + "<span>\
                  (Multiple answer)\
                </h5>\
                <input class='form-control m-input' required='required' type='text' name='survey[survey_questions_attributes][" + uuid + "][question]' id='survey_question_title_" + count + "' data-validate='true'>\
                <input type='hidden' name='survey[survey_questions_attributes][" + uuid + "][question_type]' value=2>\
                <input type='hidden' name='survey[survey_questions_attributes][" + uuid + "][weight]' value=" + count + ">\
                <div class='answers col-lg-10' id='answers_" + uuid + "'>\
                  <h6 class='m--font-brand'>Answers</h6>\
                  <div class='form-group m-form__group row align-items-center'>\
                    <div class='col-md-10'>\
                      <div>\
                        <div>\
                          <input class='form-control m-input' required='required' type='text' name='survey[survey_questions_attributes][" + uuid + "][survey_question_answers_attributes][" + uuid2 + "][answer]' id='survey_question_answer_title_" + count + "' data-validate='true'>\
                          <input  class='weight_" + uuid2 + "' type='hidden' name='survey[survey_questions_attributes][" + uuid + "][survey_question_answers_attributes][" + uuid2 + "][weight]' value=" + 1 + ">\
                        </div>\
                      </div>\
                    </div>\
                  </div>\
                </div>\
                <div class='m-form__group form-group row'>\
                  <div class='col-lg-10'>\
                    <a href='js:' onclick='add_multiple_option(\"" + uuid + "\");' class='m-link m-link--state m-link--success'>Add option</a>&nbsp;&nbsp;\
                    <a href='js:' onclick='remove_question(\"" + uuid + "\");' class='m-link m-link--state m-link--danger'>Remove Question</a>\
                  </div>\
                </div>\
                <div class='m-form__seperator m-form__seperator--dashed m-form__seperator--space'></div>\
              </div>"
  $("#questions_body").append(html);
}

function add_paragraph_choice(){
  var uuid = generateUUID();
  var uuid2 = generateUUID();
  var add_option_link = "";
  var remove_option_link = "";
  var remove_question_link = "";
  var count = $("#questions_body .col-lg-12").length + 1;
  var html = "<div class='col-lg-12 question_" + uuid + "'>\
                <h5 class='m--font-primary'>\
                  Question #\
                  <span>" + count + "<span>\
                  (Free answer)\
                </h5>\
                <input class='form-control m-input' required='required' type='text' name='survey[survey_questions_attributes][" + uuid + "][question]' id='survey_question_title_" + count + "' data-validate='true'>\
                <input type='hidden' name='survey[survey_questions_attributes][" + uuid + "][question_type]' value=3>\
                <input type='hidden' name='survey[survey_questions_attributes][" + uuid + "][weight]' value=" + count + ">\
                <div class='m-form__group form-group row'>\
                  <div class='col-lg-10'>\
                    <a href='js:' onclick='remove_question(\"" + uuid + "\");' class='m-link m-link--state m-link--danger'>Remove Question</a>\
                  </div>\
                </div>\
                <div class='m-form__seperator m-form__seperator--dashed m-form__seperator--space'></div>\
              </div>"
  $("#questions_body").append(html);
}

function generateUUID() {
    var d = new Date().getTime();
    var uuid = 'xxxxxxxx-xxxx-4xxx-yxxx-xxxxxxxxxxxx'.replace(/[xy]/g, function(c) {
        var r = (d + Math.random()*16)%16 | 0;
        d = Math.floor(d/16);
        return (c=='x' ? r : (r&0x3|0x8)).toString(16);
    });
    return uuid;
};

function add_multiple_option(uuid){
  var uuid2 = generateUUID();
  var answer_count = ($("#answers_" + uuid + " .form-group").length + 1);
  var html = "<div class='form-group m-form__group row align-items-center option_" + uuid2 + "'>\
                    <div class='col-md-10'>\
                      <div>\
                        <div>\
                          <input class='form-control m-input' required='required' type='text' name='survey[survey_questions_attributes][" + uuid + "][survey_question_answers_attributes][" + uuid2 + "][answer]' id='survey_question_answer_title_' data-validate='true'>\
                          <!-- <input class='delete_" + uuid2 + "' type='hidden' name='survey[survey_questions_attributes][" + uuid + "][survey_question_answers_attributes][" + uuid2 + "][_delete]' value=0> -->\
                          <input  class='weight_" + uuid2 + "' type='hidden' name='survey[survey_questions_attributes][" + uuid + "][survey_question_answers_attributes][" + uuid2 + "][weight]' value=" + answer_count + ">\
                        </div>\
                      </div>\
                    </div>\
                    <div class='col-md-2'>\
                      <a onclick='remove_option(\"" + uuid2 + "\");' class='m-portlet__nav-link btn m-btn m-btn--hover-danger m-btn--icon m-btn--icon-only m-btn--pill'>\
                        <i class='la la-trash m--font-danger'></i></a>\
                    </div>\
                  </div>"
  $("#answers_" + uuid).append(html);
}



function remove_option(uuid){
  $(".option_" + uuid).remove();
  $(".delete_" + uuid).val(1);
}

function remove_question(uuid){
  $(".question_" + uuid).hide();
  $(".delete_" + uuid).val(1);
}
