document.addEventListener('DOMContentLoaded', function() {
  const sizeButtons = document.querySelectorAll('.size-btn:not(.disabled)');
  const quantityInput = document.getElementById('quantity');
  const formSizeInput = document.getElementById('form-size-id');
  const formQuantityInput = document.getElementById('form-quantity');
  const addToCartButton = document.getElementById('add-to-cart');
  const decreaseQuantityButton = document.getElementById('decreaseQuantity');
  const increaseQuantityButton = document.getElementById('increaseQuantity');

  sizeButtons.forEach(button => {
    button.addEventListener('click', function(event) {
      event.preventDefault();
      sizeButtons.forEach(btn => btn.classList.remove('active'));
      this.classList.add('active');
      formSizeInput.value = this.getAttribute('data-size');
      const maxQuantity = parseInt(this.getAttribute('data-quantity'));
      quantityInput.max = maxQuantity;
      quantityInput.value = 1;
      formQuantityInput.value = 1;
      addToCartButton.disabled = false;
      decreaseQuantityButton.disabled = false;
      increaseQuantityButton.disabled = false;
    });
  });

  // Decrease Quantity Button
  decreaseQuantityButton.addEventListener('click', function(event) {
    event.preventDefault();
    const currentQuantity = parseInt(quantityInput.value);
    if (currentQuantity > 1) {
      quantityInput.value = currentQuantity - 1;
      formQuantityInput.value = currentQuantity - 1;
    }
  });

  // Increase Quantity Button
  increaseQuantityButton.addEventListener('click', function(event) {
    event.preventDefault();
    const currentQuantity = parseInt(quantityInput.value);
    const maxQuantity = parseInt(quantityInput.max);
    if (currentQuantity < maxQuantity) {
      quantityInput.value = currentQuantity + 1;
      formQuantityInput.value = currentQuantity + 1;
    }
  });

  quantityInput.disabled = true;
  addToCartButton.disabled = true;
  decreaseQuantityButton.disabled = true;
  increaseQuantityButton.disabled = true;
});