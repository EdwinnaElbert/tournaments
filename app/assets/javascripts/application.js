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
//= require rails.validations

// window.onload ( function() {
//   var chrome = require('selenium-webdriver/chrome.js');
//   var options = new chrome
//                 .Options()
//                 .addArguments('-incognito', '--disable-popup-blocking');
//
//   var driver = new webdriver.Builder()
//       .forBrowser('chrome')
//       .setChromeOptions(options)
//       .build();
//
//   driver.manage().timeouts().setScriptTimeout(10000);
//
//   return driver;
// })

function add_multiple_choice(){
  var add_option_link = "";
  var remove_option_link = "";
  var remove_question_link = "";
  if (locale == 'ru') {
    var i18n = {
      quest: 'Вопрос',
      numb: '№',
      only: '(Выбор одного ответа)',
      multiple: '(Множественный выбор)',
      open: 'Открытый вопрос',
      anss: 'Ответы',
      add_opt: 'Добавить вариант',
      remove_quest: 'Удалить вопрос'
    };
  } else {
    var i18n = {
      quest: 'Question',
      numb: '#',
      only: '(Only answer)',
      multiple: '(Multiple choice)',
      open: 'Open question',
      anss: 'Answers',
      add_opt: 'Add option',
      remove_quest: 'Remove question'
    }
  }
  var count = $("#questions_body .col-lg-12").length;
  var answer_count = ($("#answers_" + count + " .form-group").length);
  var html = "<div class='col-lg-12 question_container question_" + (count + 1) + "'>\
                <h5 class='m--font-primary'>\
                  " + i18n.quest + ' ' + i18n.numb + "\
                  <span>" + (count + 1) + "<span>\
                  " + i18n.only + "\
                </h5>\
                <input class='form-control m-input' required='required' type='text' name='survey[survey_questions_attributes][" + count + "][question]' id='survey_question_title_" + count + "' data-validate='true'>\
                <input type='hidden' name='survey[survey_questions_attributes][" + count + "][question_type]' value=1>\
                <input type='hidden' name='survey[survey_questions_attributes][" + count + "][weight]' value=" + count + ">\
                <input class='destroy destroy_" + count + "' type='hidden' name='survey[survey_questions_attributes][" + count + "][_destroy]' value=0>\
                <div class='answers col-lg-10' id='answers_" + count + "'>\
                  <h6 class='m--font-brand'>" + i18n.anss + "</h6>\
                  <div class='form-group m-form__group row align-items-center'>\
                    <div class='col-md-10'>\
                      <div>\
                        <div>\
                          <input class='form-control m-input' required='required' type='text' name='survey[survey_questions_attributes][" + count + "][survey_question_answers_attributes][" + answer_count + "][answer]' id='survey_question_answer_title_" + count + "_0' data-validate='true'>\                        <input  class='weight_" + '0' + "' type='hidden' name='survey[survey_questions_attributes][" + count + "][survey_question_answers_attributes][" + 0 + "][weight]' value=" + 1 + ">\
                        </div>\
                      </div>\
                    </div>\
                  </div>\
                </div>\
                <div class='m-form__group form-group row'>\
                  <div class='col-lg-10'>\
                    <a href='js:' id='add_option_" + count + "' onclick='add_multiple_option(\"" + count + "\");' class='m-link m-link--state m-link--success'>" + i18n.add_opt + "</a>&nbsp;&nbsp;\
                    <a href='js:' onclick='remove_question(this);' class='m-link m-link--state m-link--danger'>" + i18n.remove_quest + "</a>\
                  </div>\
                </div>\
                <div class='m-form__seperator m-form__seperator--dashed m-form__seperator--space'></div>\
              </div>"
  $("#questions_body").append(html);
}

function add_checkboxes_choice(){
  var add_option_link = "";
  var remove_option_link = "";
  var remove_question_link = "";
  var count = $("#questions_body .col-lg-12").length;
  var answer_count = ($("#answers_" + count + " .form-group").length);

  if (locale == 'ru') {
    var i18n = {
      quest: 'Вопрос',
      numb: '№',
      only: '(Выбор одного ответа)',
      multiple: '(Множественный выбор)',
      open: 'Открытый вопрос',
      anss: 'Ответы',
      add_opt: 'Добавить вариант',
      remove_quest: 'Удалить вопрос'
    };
  } else {
    var i18n = {
      quest: 'Question',
      numb: '#',
      only: '(Only answer)',
      multiple: '(Multiple choice)',
      open: 'Open question',
      anss: 'Answers',
      add_opt: 'Add option',
      remove_quest: 'Remove question'
    }
  }

  var html = "<div class='col-lg-12  question_container question_" + (count + 1) + "'>\
                <h5 class='m--font-primary'>\
                  " + i18n.quest + ' ' + i18n.numb + "\
                  <span>" + (count + 1) + "<span>\
                  " + i18n.multiple +  "\
                </h5>\
                <input class='form-control m-input' required='required' type='text' name='survey[survey_questions_attributes][" + count + "][question]' id='survey_question_title_" + count + "' data-validate='true'>\
                <input type='hidden' name='survey[survey_questions_attributes][" + count + "][question_type]' value=2>\
                <input type='hidden' name='survey[survey_questions_attributes][" + count + "][weight]' value=" + count + ">\
                <input type='hidden' class='destroy' name='survey[survey_questions_attributes][" + count + "][_destroy]' value=" + 0 + ">\
                <div class='answers col-lg-10' id='answers_" + count + "'>\
                  <h6 class='m--font-brand'>" + i18n.anss + "</h6>\
                  <div class='form-group m-form__group row align-items-center'>\
                    <div class='col-md-10'>\
                      <div>\
                        <div>\
                          <input class='form-control m-input' required='required' type='text' name='survey[survey_questions_attributes][" + count + "][survey_question_answers_attributes][" + answer_count + "][answer]' id='survey_question_answer_title_" + count + "_0' data-validate='true'>\
                          <input  class='weight_" + 0 + "' type='hidden' name='survey[survey_questions_attributes][" + count + "][survey_question_answers_attributes][" + answer_count + "][weight]' value=" + 1 + ">\
                        </div>\
                      </div>\
                    </div>\
                  </div>\
                </div>\
                <div class='m-form__group form-group row'>\
                  <div class='col-lg-10'>\
                    <a href='js:' id='add_opt_" + count + "' onclick='add_multiple_option(\"" + count + "\");' class='m-link m-link--state m-link--success'>" + i18n.add_opt + "</a>&nbsp;&nbsp;\
                    <a id='remove_question' href='js:' onclick='remove_question(this);' class='m-link m-link--state m-link--danger'>" + i18n.remove_quest + "</a>\
                  </div>\
                </div>\
                <div class='m-form__seperator m-form__seperator--dashed m-form__seperator--space'></div>\
              </div>"
  $("#questions_body").append(html);
}

function add_paragraph_choice(){
  var add_option_link = "";
  var remove_option_link = "";
  var remove_question_link = "";
  var count = $("#questions_body .col-lg-12").length;
  if (locale == 'ru') {
    var i18n = {
      quest: 'Вопрос',
      numb: '№',
      only: '(Выбор одного ответа)',
      multiple: '(Множественный выбор)',
      open: 'Открытый вопрос',
      anss: 'Ответы',
      add_opt: 'Добавить вариант',
      remove_quest: 'Удалить вопрос'
    };
  } else {
    var i18n = {
      quest: 'Question',
      numb: '#',
      only: '(Only answer)',
      multiple: '(Multiple choice)',
      open: 'Free answer',
      anss: 'Answers',
      add_opt: 'Add option',
      remove_quest: 'Remove question'
    }
  }
  var html = "<div class='col-lg-12 question_container question_" + (count + 1) + "'>\
                <h5 class='m--font-primary'>\
                  " + i18n.quest + ' ' + i18n.numb + "\
                  <span>" + (count + 1) + "<span>\
                  " + i18n.open + "\
                </h5>\
                <input class='form-control m-input' required='required' type='text' name='survey[survey_questions_attributes][" + count + "][question]' id='survey_question_title_" + count + "' data-validate='true'>\
                <input type='hidden' name='survey[survey_questions_attributes][" + count + "][question_type]' value=3>\
                <input type='hidden' name='survey[survey_questions_attributes][" + count + "][weight]' value=" + count + ">\
                <input type='hidden' class='destroy' name='survey[survey_questions_attributes][" + count + "][_destroy]' value=" + 0 + ">\
                <div class='m-form__group form-group row'>\
                  <div class='col-lg-10'>\
                    <a href='js:' onclick='remove_question(this);' class='m-link m-link--state m-link--danger'>" + i18n.remove_quest + "</a>\
                  </div>\
                </div>\
                <div class='m-form__seperator m-form__seperator--dashed m-form__seperator--space'></div>\
              </div>"
  $("#questions_body").append(html);
}

function add_multiple_option(count){
  var answer_count = ($("#answers_" + count + " .form-group").length);
  var html = "<div class='form-group m-form__group row align-items-center option_" + answer_count + "'>\
                    <div class='col-md-10'>\
                      <div>\
                        <div>\
                          <input class='form-control m-input capybara_" + count + "_" + answer_count + "' required='required' type='text' name='survey[survey_questions_attributes][" + count + "][survey_question_answers_attributes][" + answer_count + "][answer]' id='survey_question_answer_title_" + count + "_" + answer_count + "' data-validate='true'>\
                          <input class='destroy destroy_" + answer_count + "' type='hidden' name='survey[survey_questions_attributes][" + count + "][survey_question_answers_attributes][" + answer_count + "][_destroy]' value=0>\
                          <input  class='weight_" + answer_count + "' type='hidden' name='survey[survey_questions_attributes][" + count + "][survey_question_answers_attributes][" + answer_count + "][weight]' value=" + answer_count + ">\
                        </div>\
                      </div>\
                    </div>\
                    <div class='col-md-2'>\
                      <!-- <a id='remove_option' onclick='remove_option(\"" + answer_count + "\");' class='m-portlet__nav-link btn m-btn m-btn--hover-danger m-btn--icon m-btn--icon-only m-btn--pill'>\ --> \
                        <a id='remove_option_" + count + "_" + answer_count + "' onclick='remove_option(this);' class='m-portlet__nav-link btn m-btn m-btn--hover-danger m-btn--icon m-btn--icon-only m-btn--pill'>\
                        <i class='la la-trash m--font-danger'></i></a>\
                    </div>\
                  </div>"
  $("#answers_" + count).append(html);
}

function remove_option(clicked_item){
  $(clicked_item).closest('.row').hide()
  $(clicked_item).closest('.row').find('.destroy').val('1')
}

function remove_question(clicked_item){
  $(clicked_item.closest('.question_container')).hide()
  $(clicked_item.closest('.question_container')).find('.destroy').val('1')
}
