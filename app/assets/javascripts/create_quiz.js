$(document).ready(function() {
    attachListeners();
});

function attachListeners(){
  $( document ).delegate('form[id=new_quiz]', "submit", function(e){

  // $('form[id=new_quiz]').submit((e) => {
     alert('is this working?')
    e.preventDefault();

    var values = $(this).serialize();
    debugger
    var posting = $.post('/quizzes', values);
    debugger

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

     let url = this.attributes.href.textContent
     console.log(url)
     debugger
     $.get(url, function(data){
       $('.page-body').empty()
       let quizPage = data
       let quizName = quizPage.name
       debugger
       // $('.page-body').append(quizPage.name + quizPage.games[0].score)

       let source = $("#quiz-form-template")[0].innerHTML
       let template = Handlebars.compile(source)
       let context = {name: "name"}
       let html = template(context)
     })
     alert('getting damn close')
     e.preventDefault();
   })

  // debugger
   // e.preventDefault();
  })


  // $(document).on('page:change', function(){
  //
  // })

  $('#create-quiz').click((e) =>{
    // loadQuizForm()
    $.get('quizzes/new', function(data){
      let html = data
      $('.page-body').html(html)
    })
    e.preventDefault()
  })
}

function loadQuizForm() {

   let source = document.getElementById("quiz-form-template").innerHTML
   let template = Handlebars.compile(source)
   let context = {}
   let html = template(context)
   $('.page-body').empty()
   $('.page-body').append(html)
}


// def show
//   category = Category.find_by_name(params[:category])
//   @quizzes = Quiz.by_category(category.id)
// end
