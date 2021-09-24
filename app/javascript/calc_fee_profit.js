function calc_fee_profit (){
  const price = document.getElementById("item-price");
  price.addEventListener("input", () => {
    const inputPrice = price.value;
    const calcFee = document.getElementById("add-tax-price");
    calcFee.innerHTML = Math.floor( inputPrice * 0.1 ).toLocaleString();
    const calcProfit = document.getElementById("profit");
    calcProfit.innerHTML =  ( inputPrice - Math.floor( inputPrice * 0.1 )).toLocaleString();
  });
};

window.addEventListener('load', calc_fee_profit);