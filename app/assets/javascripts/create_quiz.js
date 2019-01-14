$( document ).on('turbolinks:load', function(){
      attachListeners();
});

function attachListeners(){
  $( document ).delegate('form[id=new_quiz]', "submit", function(e){

  // $('form[id=new_quiz]').submit((e) => {
    e.preventDefault();

    var values = $(this).serialize();

    var posting = $.post('/quizzes', values);


    posting.done(function(data) {
      $('#quiz-form').empty()
        let quiz = new Quiz(data)
        quiz.createHtmlForQuizName()
        quiz.createHtmlForCategories()
        quiz.createHtmlForQuestionsAndAnswers()
        //  debugger
        // var quiz = data;
        //  $("#quizName").text(quiz["name"]);
        //  $("#question1").text(quiz.question_and_answers[0].question);
        //  $("#answer1").text(quiz.question_and_answers[0].answer);
        //  $("#question2").text(quiz.question_and_answers[1].question);
        //  $("#answer2").text(quiz.question_and_answers[1].answer);
        //  $("#question3").text(quiz.question_and_answers[2].question);
        //  $("#answer3").text(quiz.question_and_answers[2].answer);
        //  $("#question4").text(quiz.question_and_answers[3].question);
        //  $("#answer4").text(quiz.question_and_answers[3].answer);
        //  $("#question5").text(quiz.question_and_answers[4].question);
        //  $("#answer5").text(quiz.question_and_answers[4].answer);

    })
  })

  $('#category').change(() =>{
    alert("I changed this")
    $('.list-quizzes').empty()
    $('.list-quizzes').append('<tbody><tr><td>Quiz Name</td><td>Created By</td><td>The Top Score</td></tr></tbody>')


    let cat = $('#category').val();
    // debugger
    $.get("/quizzes/categories/" + cat, function(data) {
      console.log(data)
      // Replace text of body-id div
     // let name = data["0"].name
     data.forEach((e)=> {
       quiz = new Quiz(e)
     $('.list-quizzes tr:last').after(quiz.createTr());
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
    $('.welcome-page').hide()
    $('#quiz-name').text('Quiz Name')
    $('#created-by').text('Created By')
    $('#top-score').text('The Top Score')

    $.get("/quizzes.json", function(quizzes){
      quizzes.forEach((e)=> {
        quiz = new Quiz(e)

      $('.list-quizzes tr:last').after(quiz.createTr())

      // $('.page-body').append(`<p><a class="list-quizzes" id="quiz-${e.id}" href='/quizzes/${e.id}'>${e.name}</a> <br> ${e.games.length} </p>`);
      // })
    })
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
    $('#load-games').hide();
    e.preventDefault()
  })

   $('#hide-games').click((e) =>{
     $('#games-played').hide();

     e.preventDefault()
   })

  $('#load-quizzes-created').click((e) => {
    alert('whatz up')
    $.get('/users/quizzes_user_created', function(createdQuizzes){
      $('#quizzes-created').html(createdQuizzes)

    })
    $('#load-quizzes-created').hide();
    e.preventDefault()
  })

  $('#hide-quizzes').click((e) => {
    $('#quizzes-created').hide();
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
    this.questionAndAnwers = quizJson.question_and_answers
    this.categories = quizJson.categories.map((category) => category.name)
    // this.highScore = 0 || Math.max.apply(null,this.scores)

   }
   createTr() {
     return `<tr> <td> <a href="quizzes/${this.id}">${this.name} </a></td> <td> <a href="users/${this.userId}"> ${this.userName} </td> <td> ${this.highScore} </td> </tr>`
   }
   createLi() {
     return `Quiz Name: <a href="quizzes/${this.id}">${this.name} </a> Created By: <a href="users/${this.userId}"> ${this.userName} </a> High Score: ${this.highScore}`
   }

   createHtmlForQuizName(){
     return  $("#quizName").text(`Quiz Name: ${this.name}`);
   }
   createHtmlForCategories(){
     let listEach = () => {
       this.categories.forEach((category) => {
         category + '&nbsp'
       })
     }
     return $('#categories').text(`Categories: ${listEach()}`)
     }

   createHtmlForQuestionsAndAnswers(){
     let i = 0
     for (i = 0; i < this.questionAndAnwers.length; i++) {
       return $(`#question${i+1}`).text(this.questionAndAnwers[i][0]);
              $(`#answer${i+1}`).text(this.questionAndAnwers[i][1])
     }
   }
 }


// def show
//   category = Category.find_by_name(params[:category])
//   @quizzes = Quiz.by_category(category.id)
// end
