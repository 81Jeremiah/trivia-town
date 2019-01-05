$( document ).ready(function() {
    attachListeners();
});

function attachListeners(){
  $('form[id=new_quiz]').submit((e) => {
       $('#quiz-form').empty()

    e.preventDefault();

    var values = $(e.currentTarget).serialize();
    var posting = $.post('/quizzes', values);

    posting.done(function(data) {


        var quiz = data;
         $("#quizName").text(quiz["name"]);
         $("#question1").text(quiz.question_and_answers[0].question);
         $("#answer1").text(quiz.question_and_answers[0].answer);
         $("#question2").text(quiz.question_and_answers[1].question);
         $("#answer2").text(quiz.question_and_answers[1].answer);
         $("#question3").text(quiz.question_and_answers[2].question);
         $("#answer3").text(quiz.question_and_answers[2].answer);
         $("#question4").text(quiz.question_and_answers[3].question);
         $("#answer4").text(quiz.question_and_answers[3].answer);
         $("#question5").text(quiz.question_and_answers[4].question);
         $("#answer5").text(quiz.question_and_answers[4].answer);

    })

  })
  $('#category').change(() =>{
    $('.page-body').empty()
    let cat = $('#category').val();
    // debugger
    $.get("/quizzes/categories/" + cat, function(data) {
      console.log(data)
      // Replace text of body-id div
      $('.page-body').html(data);
    });

  })

  $('#please-work').click((e) =>{
    $.get("/quizzes.json", function(data){
      console.log(data)
    })
    e.preventDefault();
  })

}

// def show
//   category = Category.find_by_name(params[:category])
//   @quizzes = Quiz.by_category(category.id)
// end
