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
  var question
  var count = $("#questions_body .col-lg-12").length;
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
                          <input class='form-control m-input' required='required' type='text' name='survey[survey_questions_attributes][" + count + "][survey_question_answers_attributes][" + 0 + "][answer]' id='survey_question_answer_title_" + count + "' data-validate='true'>\
                          <input  class='weight_" + '0' + "' type='hidden' name='survey[survey_questions_attributes][" + count + "][survey_question_answers_attributes][" + 0 + "][weight]' value=" + 1 + ">\
                        </div>\
                      </div>\
                    </div>\
                  </div>\
                </div>\
                <div class='m-form__group form-group row'>\
                  <div class='col-lg-10'>\
                    <a href='js:' onclick='add_multiple_option(\"" + count + "\");' class='m-link m-link--state m-link--success'>" + i18n.add_opt + "</a>&nbsp;&nbsp;\
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
                          <input class='form-control m-input' required='required' type='text' name='survey[survey_questions_attributes][" + count + "][survey_question_answers_attributes][" + 0 + "][answer]' id='survey_question_answer_title_" + 0 + "' data-validate='true'>\
                          <input  class='weight_" + 0 + "' type='hidden' name='survey[survey_questions_attributes][" + count + "][survey_question_answers_attributes][" + 0 + "][weight]' value=" + 1 + ">\
                        </div>\
                      </div>\
                    </div>\
                  </div>\
                </div>\
                <div class='m-form__group form-group row'>\
                  <div class='col-lg-10'>\
                    <a href='js:' onclick='add_multiple_option(\"" + count + "\");' class='m-link m-link--state m-link--success'>" + i18n.add_opt + "</a>&nbsp;&nbsp;\
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
                          <input class='form-control m-input' required='required' type='text' name='survey[survey_questions_attributes][" + count + "][survey_question_answers_attributes][" + answer_count + "][answer]' id='survey_question_answer_title_' data-validate='true'>\
                          <input class='destroy destroy_" + answer_count + "' type='hidden' name='survey[survey_questions_attributes][" + count + "][survey_question_answers_attributes][" + answer_count + "][_destroy]' value=0>\
                          <input  class='weight_" + answer_count + "' type='hidden' name='survey[survey_questions_attributes][" + count + "][survey_question_answers_attributes][" + answer_count + "][weight]' value=" + answer_count + ">\
                        </div>\
                      </div>\
                    </div>\
                    <div class='col-md-2'>\
                      <!-- <a id='remove_option' onclick='remove_option(\"" + answer_count + "\");' class='m-portlet__nav-link btn m-btn m-btn--hover-danger m-btn--icon m-btn--icon-only m-btn--pill'>\ --> \
                        <a id='remove_option' onclick='remove_option(this);' class='m-portlet__nav-link btn m-btn m-btn--hover-danger m-btn--icon m-btn--icon-only m-btn--pill'>\
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

// window.ClientSideValidations.formBuilders['ActionView::Helpers::FormBuilder'] = {
//   add: function(element, settings, message) {
//     // var form, inputErrorField, label, labelErrorField;
//     // form = $(element[0].form);
//     // if (element.data('valid') !== false && (form.find("label.message[for='" + (element.attr('id')) + "']")[0] == null)) {
//     //   inputErrorField = $(settings.input_tag);
//     //   labelErrorField = $(settings.label_tag);
//     //   label = form.find("label[for='" + (element.attr('id')) + "']:not(.message)");
//     //   if (element.attr('autofocus')) {
//     //     element.attr('autofocus', false);
//     //   }
//     //   element.before(inputErrorField);
//     //   inputErrorField.find('span#input_tag').replaceWith(element);
//     //   inputErrorField.find('label.message').attr('for', element.attr('id'));
//     //   labelErrorField.find('label.message').attr('for', element.attr('id'));
//     //   labelErrorField.insertAfter(label);
//     //   labelErrorField.find('label#label_tag').replaceWith(label);
//     // }
//     // return form.find("label.message[for='" + (element.attr('id')) + "']").text(message);
//     console.log(element)
//     $(element).closest('.has_danger').append(message);
//     // console.log(message);
//     // custom add code here
//   },
//
//   remove: function(element, settings) {
//     var errorFieldClass, form, inputErrorField, label, labelErrorField;
//     form = $(element[0].form);
//     errorFieldClass = $(settings.input_tag).attr('class');
//     inputErrorField = element.closest("." + (errorFieldClass.replace(/\ /g, ".")));
//     label = form.find("label[for='" + (element.attr('id')) + "']:not(.message)");
//     labelErrorField = label.closest("." + errorFieldClass);
//     if (inputErrorField[0]) {
//       inputErrorField.find("#" + (element.attr('id'))).detach();
//       inputErrorField.replaceWith(element);
//       label.detach();
//       return labelErrorField.replaceWith(label);
//       }
//     }
// }
