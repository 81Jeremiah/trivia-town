function init() {
  //put any page initialization/handlebars initialization here
  initForm()
}

document.addEventListener("DOMContentLoaded", function(event) {
  init()
})


function initForm() {
  let formTemplate = document.getElementById("comment-form").innerHTML
  let template = Handlebars.compile(formTemplate)

  document.getElementsByTagName("main")[0].innerHTML = template({'submitAction': 'createComment()'})
}

  // $(document.body).on("submit", "#submit-comment", function() {alert("hey");});

function createComment() {
  let recipe = $("#new-comment").val()

}
