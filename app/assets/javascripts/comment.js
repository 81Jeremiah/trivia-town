//add comment form to page
$( document ).ready(() => {
  $("#add-comment").click((e) => {
    $.get(e.target.href,(data) =>{
      $(".new-comment-form").html(data)
    })
    e.preventDefault()
  })
//submit comment and render back in Json
$( document ).delegate('form[id=new_comment]', "submit", function(e){
    e.preventDefault();
    let values = $(this).serialize();
    let href = this.action
    let posting = $.post(href, values);
    posting.done(function(data) {
      let comment = new Comment(data)
      let newComment = comment.createComment()
      $('.comment-list').append(newComment)
      $('#comment_content').val(" ")
    });
  })
})
//build class and use protype to build html for comment
class Comment{
  constructor(commentJson) {
    this.content = commentJson.content
    this.username = commentJson.user.username
    this.userId = commentJson.userId

   }
   createComment() {
     return `<p> <a href="users/${this.userId}">${this.username}</a> said: ${this.content} </p>`
   }
 }
