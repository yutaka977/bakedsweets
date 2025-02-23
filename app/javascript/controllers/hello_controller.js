import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  connect() {
    this.element.textContent = "Hello World!"
  }
}
document.addEventListener("DOMContentLoaded", function () {
  setTimeout(() => {
      document.querySelector(".slide").style.opacity = "1";
  }, 3000); // 黒い画面が消えた後に最初の画像がフェードイン
});