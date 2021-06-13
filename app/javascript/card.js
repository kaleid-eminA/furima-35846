const pay = () => {
  Payjp.setPublicKey("pk_test_cd70e7557d00672b9985c6cf"); 
  const form = document.getElementById("charge-form");
  form.addEventListener("submit", (e) => {
    e.preventDefault();
    const formResult = document.getElementById("charge-form");
    const formData = new FormData(formResult);

    const card = {
      number: formData.get("order_destination[card_number]"),
      cvc: formData.get("order_destination[card_cvc]"),
      exp_month: formData.get("order_destination[card_exp_month]"),
      exp_year: `20${formData.get("order_destination[card_exp_year]")}`,
    };

    Payjp.createToken(card, (status, response) => {
      if (status == 200) {
        const token = response.id;
        const renderDom = document.getElementById("charge-form");
        const tokenObj = `<input value=${token} name='token' type="hidden"> `;
        renderDom.insertAdjacentHTML("beforeend", tokenObj);
      }

      document.getElementById("order_destination_number").removeAttribute("name");
      document.getElementById("order_destination_cvc").removeAttribute("name");
      document.getElementById("order_destination_exp_month").removeAttribute("name");
      document.getElementById("order_destination_exp_year").removeAttribute("name");

      document.getElementById("charge-form").submit();
    });
  });
};

window.addEventListener("load", pay);