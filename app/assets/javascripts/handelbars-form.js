$(document).ready(function() {

// $('#create-quiz').click(() =>{
//   loadQuizForm()
// })

 // $('form[id=new_quiz]').submit((e) => {
 //
 //   e.preventDefault();
 //
 //   var values = $(e.currentTarget).serialize();
 //   var posting = $.post('/quizzes', values);
 //
 //   posting.done(function(data) {
 //      $('#quiz-form').empty()
 //
 //       var quiz = data;
 //        $("#quizName").text(quiz["name"]);
 //        $("#question1").text(quiz.question_and_answers[0].question);
 //        $("#answer1").text(quiz.question_and_answers[0].answer);
 //        $("#question2").text(quiz.question_and_answers[1].question);
 //        $("#answer2").text(quiz.question_and_answers[1].answer);
 //        $("#question3").text(quiz.question_and_answers[2].question);
 //        $("#answer3").text(quiz.question_and_answers[2].answer);
 //        $("#question4").text(quiz.question_and_answers[3].question);
 //        $("#answer4").text(quiz.question_and_answers[3].answer);
 //        $("#question5").text(quiz.question_and_answers[4].question);
 //        $("#answer5").text(quiz.question_and_answers[4].answer);
 //
 //   })
 // })
})

// function loadQuizForm() {
//  let source = document.getElementById("quiz-form-template").innerHTML
//  let template = Handlebars.compile(source)
//  let context = {}
//  let html = template(context)
//
//  $('.page-body').append(html)
// }

const question_and_answers =[
{
question: "What year did it come out?",
answer: "1977",
id: 1,
quiz: {
name: "Star Wars Quiz"
}
},
{
question: "What was the name of the lead protagonist?",
answer: "Luke Skywalker",
id: 2,
quiz: {
name: "Star Wars Quiz"
}
},
{
question: "Who was the robot that spoke english?",
answer: "C3PO",
id: 3,
quiz: {
name: "Star Wars Quiz"
}
},
{
question: "Who shot first in the Cantina",
answer: "Han Solo",
id: 4,
quiz: {
name: "Star Wars Quiz"
}
},
{
question: "Who sold Luke and Ben the droids?",
answer: "Jawas",
id: 5,
quiz: {
name: "Star Wars Quiz"
}
}
]
