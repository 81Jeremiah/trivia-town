$(document).ready(function() {
  // let source = $("#quiz-form-template")[0].innerHTML
  // let template = Handlebars.compile(source)
  // let context = {name: "name"}
  // let html = template(context)
  var source   = document.getElementById("entry-template").innerHTML;
  var template = Handlebars.compile(source);
  debugger
  var context = {title: "My New Post", body: "This is my first post!"};
  var html    = template(context);
  $('.page-body').append(html)
})
