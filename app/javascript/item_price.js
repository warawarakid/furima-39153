window.addEventListener('load', () => {

  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;
    
    const fee = Math.floor(inputValue * 0.1);
  
    const profit = inputValue - fee;

    const addTaxDom = document.getElementById("add-tax-price"); 
    addTaxDom.innerHTML = fee.toLocaleString(); 
    
    const profitDom = document.getElementById("profit"); 
    profitDom.innerHTML = profit.toLocaleString(); 
})
});



