function calc_fee_profit (){
  const price = document.getElementById("item-price");
  price.addEventListener("input", () => {
    const inputPrice = price.value;
    const calcFee = document.getElementById("add-tax-price");
    calcFee.innerHTML = Math.floor( inputPrice * 0.1 );
    const calcProfit = document.getElementById("profit");
    calcProfit.innerHTML = Math.floor( inputPrice * ( 1 - 0.1 ));
  });
};

window.addEventListener('load', calc_fee_profit);