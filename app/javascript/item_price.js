function price (){
  const origin = document.getElementById('item-price');
  origin.addEventListener("input",()=>{
    var inputValue = origin.value;
    inputValue =parseInt(inputValue)
    console.log(inputValue);

    const addTaxDom = document.getElementById("add-tax-price");
    var tax= addTaxDom.innerHTML = Math.floor(inputValue  * 0.1);
    tax =parseInt(tax)
    var answer = inputValue - tax
    var profit = document.getElementById("profit")
    profit.innerHTML = answer
  });
};

window.addEventListener('load', price);