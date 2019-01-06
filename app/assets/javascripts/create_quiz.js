$(document).ready(function() {
    attachListeners();
});

function attachListeners(){

  $('form[id=new_quiz]').submit((e) => {

    e.preventDefault();

    var values = $(e.currentTarget).serialize();
    var posting = $.post('/quizzes', values);

    posting.done(function(data) {
      $('#quiz-form').empty()

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
    alert("I changed this")
    $('.page-body').empty()
    let cat = $('#category').val();
    // debugger
    $.get("/quizzes/categories/" + cat, function(data) {
      console.log(data)
      // Replace text of body-id div
     // let name = data["0"].name
     data.forEach((e)=> {
     $('.page-body').append(`<p><a href='/quizzes/${e.id}'>${e.name}</a> <br> ${e.games.length} </p>`);
   });

    });

  })

  $('#please-work').click((e) =>{
    $.get("/quizzes.json", function(data){
      console.log(data)
    })
    e.preventDefault();
  })

  $('.all-quizzes').click((e) =>{
    $('.page-body').empty()

    $.get("/quizzes", function(data){
      data.forEach((e)=> {
      $('.page-body').append(`<p><a class="list-quizzes" id="quiz-${e.id}" href='/quizzes/${e.id}'>${e.name}</a> <br> ${e.games.length} </p>`);
      })
    })
    e.preventDefault();
  })

  // $("#quiz-1").on('click', function(e){
  $( document ).delegate('.list-quizzes', "mouseover", function(e){
    let q = this.id
    console.log(q)
    // debugger
   $("#" + q).click((e) =>{
     alert('getting damn close')
     e.preventDefault();
   })

  // debugger
   // e.preventDefault();
  })


  // $(document).on('page:change', function(){
  //
  // })

}


  $("#link-this").click((e) =>{
    alert('work mother flower')
  })


// def show
//   category = Category.find_by_name(params[:category])
//   @quizzes = Quiz.by_category(category.id)
// end
