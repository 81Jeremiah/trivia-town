$(document).ready(function() {
  let source = document.getElementById("quiz-form-template").innerHTML
  let template = Handlebars.compile(source)
  let context = {name: "name", question1: "question1", answer1: "answer1",question2: "question2", answer2: "answer2", question3: "question3", answer3: "answer3", question4: "question4", answer4: "answer4", question5: "question5", answer5: "answer5"}
  let html = template(context)
  // var source   = document.getElementById("entry-template").innerHTML;
  // var template = Handlebars.compile(source);
  // debugger
  // var context = {title: "My New Post", body: "This is my first post!"};
  // var html    = template(context);
  $('.page-body').append(html)
})
