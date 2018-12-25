$( document ).ready(function() {
    attachListeners();
});

function attachListeners(){
  $('form[id=new_quiz]').submit((e) => {


    e.preventDefault();
    var values = $(e.currentTarget).serialize();
    var posting = $.post('/quizzes', values);

    posting.done(function(data) {
        var quiz = data;
         $("#quizName").text(quiz["name"]);
         $("#question1").text(quiz[question_and_answers_attributes][0][question]);
         $("#answer1").text(quiz[question_and_answers_attributes][0][answer]);
         $("#question2").text(quiz[question_and_answers_attributes][1][question]);
         $("#answer2").text(quiz[question_and_answers_attributes][1][answer]);
         $("#question3").text(quiz[question_and_answers_attributes][2][question]);
         $("#answer3").text(quiz[question_and_answers_attributes][2][answer]);
         $("#question4").text(quiz[question_and_answers_attributes][3][question]);
         $("#answer4").text(quiz[question_and_answers_attributes][3][answer]);
         $("#question5").text(quiz[question_and_answers_attributes][4][question]);
         $("#answer5").text(quiz[question_and_answers_attributes][4][answer]);
    })
    debugger
  })
}
