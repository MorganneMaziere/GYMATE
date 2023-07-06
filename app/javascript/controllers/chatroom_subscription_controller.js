import { Controller } from "@hotwired/stimulus"
import { createConsumer } from "@rails/actioncable"

export default class extends Controller {
  static values = {
    chatroomId: Number,
    userId: Number
   }
  static targets = ["messages"]

  connect() {
    this.channel = createConsumer().subscriptions.create(
      { channel: "ChatroomChannel", id: this.chatroomIdValue },
      { received: ({ authorId, content }) => {
        this.#insertMessageAndScrollDown(content)

        // Si c'est l'auteur du message ajouter la classe sender et enlever la classe
        if (this.userIdValue === authorId) {
          this.messagesTarget.lastElementChild.classList.remove('receiver-style')
          this.messagesTarget.lastElementChild.classList.add('sender-style')
        }
      }}
    );
    console.log(`Subscribed to the chatroom with the id ${this.chatroomIdValue}.`);
  }

  #insertMessageAndScrollDown(data) {
    this.messagesTarget.insertAdjacentHTML("beforeend", data)
    // window.scrollTo(0, document.body.scrollHeight);
    this.messagesTarget.scrollTo(0, this.messagesTarget.scrollHeight)
  }

  resetForm(event) {
    event.target.reset()
  }
}
