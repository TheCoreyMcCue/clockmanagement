const htmlToText = () => {
  const container = document.querySelector('.ranking-container');

  if (container) {
    const data = container.dataset.ranking;
    console.log(data);
    container.insertAdjacentHTML("beforeend", `<div>${data}<div>`);
  }
}

export default htmlToText;