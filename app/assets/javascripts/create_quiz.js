$( document ).on('turbolinks:load', function(){
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
       quiz = new Quiz(e)
     $('.page-body').append('<p>' + quiz.createLi() + '</p>');
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
    alert('was this clicked?')
    $('.page-body').empty()

    $.get("/quizzes", function(data){
      $('.page-body').html(data)
      // data.forEach((e)=> {
      // $('.page-body').append(`<p><a class="list-quizzes" id="quiz-${e.id}" href='/quizzes/${e.id}'>${e.name}</a> <br> ${e.games.length} </p>`);
      // })
    })
    e.preventDefault();
  })

  // $("#quiz-1").on('click', function(e){
  $( document ).delegate('.indv-quiz', "mouseover", function(e){
  // $('.indv-quiz').on("mouseover", function(e) {
    let q = this.id
    console.log(q)
    // debugger
   $("#" + q).click((e) =>{

     let url = this.attributes.href.textContent
     console.log(url)
      $('.page-body').empty()

     $.get(url, function(data){



       let quizPage = data
       let quizName = quizPage.name
       $('.page-body').html(quizPage)
       // $('.page-body').append(quizPage.name + quizPage.games[0].score)
       //
       // let source = $("#quiz-form-template")[0].innerHTML
       // let template = Handlebars.compile(source)
       // let context = {name: "name"}
       // let html = template(context)
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

  $('#load-games').click((e) =>{
    // alert("whats up cheif")
    $.get('/users/games_users_played', function(games){
      $('#games-played').html(games)
    })
      $('#games-played').toggle();
    e.preventDefault()
  })

  $('#load-quizzes-created').click((e) => {
    $.get('users/quizzes_user_created', function(createdQuizzes){
      $('#quizzes-created').html(createdQuizzes)

    })
    $('#quizzes-created').toggle();
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

class Quiz {
  constructor(quizJson) {
    this.name = quizJson.name

    this.id = quizJson.id
    this.userName = quizJson.user.username
    this.userId = quizJson.user_id
    this.scores = quizJson.games.map((game) => game.score)
    this.highScore = this.scores.length === 0 ? 0 :  Math.max.apply(null,this.scores)
    // this.highScore = 0 || Math.max.apply(null,this.scores)

   }

   createLi() {
     return `Quiz Name: <a href="quizzes/${this.id}">${this.name} </a> Created By: <a href="users/${this.userId}"> ${this.userName} </a> High Score: ${this.highScore}`
   }
}

// def show
//   category = Category.find_by_name(params[:category])
//   @quizzes = Quiz.by_category(category.id)
// end
