function tax (){
  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value * 0.1;
    const addTaxDom = document.getElementById("add-tax-price");
    addTaxDom.innerHTML = `${Math.floor(inputValue)}`;
    const profitNumber = priceInput.value - inputValue ;
    const profit = document.getElementById("profit");
    profit.innerHTML = `${Math.floor(profitNumber)}`;
  });
}

window.addEventListener('load', tax);