$( document ).on('turbolinks:load', function(){
      attachListeners();
});

function attachListeners(){
  //submit the form to build a new quiz with AJAX
  $( document ).delegate('form[id=new_quiz]', "submit", function(e){

    e.preventDefault();
    let values = $(this).serialize();
    let posting = $.post('/quizzes', values);

    posting.done(function(data) {
      $('#quiz-form').empty()
        let quiz = new Quiz(data);
        quiz.createHtmlForQuizName();
        quiz.createHtmlForCategories();
        quiz.createHtmlForQuestionsAndAnswers().forEach(function(html){
          return html
        })

        quiz.addLinks()//add links in footer
    })
  })
//use Ajax and JS to select category without loading the page
  $('#category').change(() =>{
    $('.list-quizzes').empty()
    $('.list-quizzes').append('<tbody><tr><td>Quiz Name</td><td>Created By</td><td>The Top Score</td></tr></tbody>')

    let cat = $('#category').val();
    $.get("/quizzes/categories/" + cat, function(data) {
      data.forEach((e)=> {
        quiz = new Quiz(e);
        $('.list-quizzes tr:last').after(quiz.createTr());
      });
    });
  })
//load the quizzes index page and inject into a table
  $('.all-quizzes').click((e) =>{
    $('.welcome-page').hide()
    $('#quiz-name').text('Quiz Name')
    $('#created-by').text('Created By')
    $('#top-score').text('The Top Score')

    $.get("/quizzes.json", function(quizzes){
      quizzes.forEach((e)=> {
        quiz = new Quiz(e)

      $('.list-quizzes tr:last').after(quiz.createTr())
      })
    })
    e.preventDefault();
  })
  // go to the quiz show page my mousing over link -new feature - working on
//   $( document ).delegate('.indv-quiz', "mouseover", function(e){
//     let q = this.id
//     console.log(q)
//    $("#" + q).click((e) =>{
//      let url = this.attributes.href.textContent
//       $('.page-body').empty()
//         $.get(url, function(data){
//            let quizPage = data;
//            let quizName = quizPage.name;
//            $('.page-body').html(quizPage);
//         })
//      e.preventDefault();
//    })
// })
//load all the games a use has played on the home page
  $('#load-games').click((e) => {
    $.get('/users/games_users_played', function(games){
      $('#games-played').html(games);
    })
    $('#load-games').hide();
    e.preventDefault()
  })
//collapse the loaded games
  $('#hide-games').click((e) =>{
     $('#games-played').hide();
     e.preventDefault();
   })
//load all the quizzes a user created when link clicked on home page
  $('#load-quizzes-created').click((e) => {
    $.get('/users/quizzes_user_created', function(createdQuizzes){
      $('#quizzes-created').html(createdQuizzes);
    })
    $('#load-quizzes-created').hide();
    e.preventDefault();
  })
//hide the created quizes
  $('#hide-quizzes').click((e) => {
    $('#quizzes-created').hide();
    e.preventDefault();
  });


}
//quiz class with contructors to build out quiz objects and call functions
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
       let categories = this.categories

     return $('#categories').text(`Categories: ${categories}`)
    }

   createHtmlForQuestionsAndAnswers(){

       let qa = this.questionAndAnwers
       let qaArray = []
       qa.forEach(function (object) {
         let idNum = qa.indexOf(object) + 1
         let questionHtml = $('#question'+ idNum).text(`Question: ${object.question}`)
         let answerHtml = $('#answer' +idNum).text(`Answer: ${object.answer}`)
         qaArray.push(question1,answerHtml)
     })
     return qaArray

   }
   addLinks(){
     $('footer').html(`<button type="button" class="btn btn-outline-primary"><a href='/quizzes/${this.id}/edit'>Edit</a></button>    <button type="button" class="btn btn-outline-primary">  <a href='/quizzes'> Quizzes</a></button>`)
   }
 }
