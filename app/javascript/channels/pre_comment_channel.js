import consumer from "./consumer"

if(location.pathname.match(/\/events\/\d/)){
  consumer.subscriptions.create({
    channel: "PreCommentChannel",
    event_id: location.pathname.match(/\d+/)[0]
  }, {

  // consumer.subscriptions.create("PreCommentChannel", {
    connected() {
      // Called when the subscription is ready for use on the server
    },

    disconnected() {
      // Called when the subscription has been terminated by the server
    },

    received(data) {
      const html = `
        <div class="comment">
          <p class="user-info">${data.user.nickname}： </p>
          <p>${data.pre_comment.content}</p>
        </div>`
      const comments = document.getElementById("pre_comments")
      comments.insertAdjacentHTML('beforeend', html)
      const commentForm = document.getElementById("comment-form")
      commentForm.reset();
    }
  });
}