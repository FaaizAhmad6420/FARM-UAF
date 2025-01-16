document.addEventListener("turbo:load", function () {
  // Sticky Navbar
  $(window).scroll(function () {
    if ($(this).scrollTop() > 40) {
      $(".navbar").addClass("sticky-top");
    } else {
      $(".navbar").removeClass("sticky-top");
    }
  });

  // Dropdown on mouse hover
  $(document).ready(function () {
    function toggleNavbarMethod() {
      if ($(window).width() > 992) {
        $(".navbar .dropdown")
          .on("mouseover", function () {
            $(".dropdown-toggle", this).trigger("click");
          })
          .on("mouseout", function () {
            $(".dropdown-toggle", this).trigger("click").blur();
          });
      } else {
        $(".navbar .dropdown").off("mouseover").off("mouseout");
      }
    }
    toggleNavbarMethod();
    $(window).resize(toggleNavbarMethod);
  });

  // Back to top button
  $(window).scroll(function () {
    if ($(this).scrollTop() > 100) {
      $(".back-to-top").fadeIn("slow");
    } else {
      $(".back-to-top").fadeOut("slow");
    }
  });
  $(".back-to-top").click(function () {
    $("html, body").animate({ scrollTop: 0 }, 1000);
    return false;
  });

  // Facts counter
  $('[data-toggle="counter-up"]').counterUp({
    delay: 10,
    time: 2000,
  });

  // Product carousel
  $(".product-carousel").owlCarousel({
    autoplay: true,
    smartSpeed: 1000,
    margin: 45,
    dots: false,
    loop: true,
    nav: true,
    navText: [
      '<i class="bi bi-arrow-left"></i>',
      '<i class="bi bi-arrow-right"></i>',
    ],
    responsive: {
      0: {
        items: 1,
      },
      768: {
        items: 2,
      },
      992: {
        items: 3,
      },
      1200: {
        items: 4,
      },
    },
  });

  // Testimonials carousel
  $(".testimonial-carousel").owlCarousel({
    autoplay: true,
    smartSpeed: 1000,
    items: 1,
    dots: false,
    loop: true,
    nav: true,
    navText: [
      '<i class="bi bi-arrow-left"></i>',
      '<i class="bi bi-arrow-right"></i>',
    ],
  });

  // Size and Quantity functionality
  const sizeButtons = document.querySelectorAll(".size-btn:not(.disabled)");
  const quantityInput = document.getElementById("quantity");
  const formSizeInput = document.getElementById("form-size-id");
  const formQuantityInput = document.getElementById("form-quantity");
  const addToCartButton = document.getElementById("add-to-cart");
  const decreaseQuantityButton = document.getElementById("decreaseQuantity");
  const increaseQuantityButton = document.getElementById("increaseQuantity");

  sizeButtons.forEach((button) => {
    button.addEventListener("click", function (event) {
      event.preventDefault();
      sizeButtons.forEach((btn) => btn.classList.remove("active"));
      this.classList.add("active");
      formSizeInput.value = this.getAttribute("data-size");
      const maxQuantity = parseInt(this.getAttribute("data-quantity"));
      quantityInput.max = maxQuantity;
      quantityInput.value = 1;
      formQuantityInput.value = 1;
      addToCartButton.disabled = false;
      decreaseQuantityButton.disabled = false;
      increaseQuantityButton.disabled = false;
    });
  });

  // Decrease Quantity Button
  if (decreaseQuantityButton) {
    decreaseQuantityButton.addEventListener("click", decrease);
  }
  function decrease() {
    const currentQuantity = parseInt(quantityInput.value);
    if (currentQuantity > 1) {
      quantityInput.value = currentQuantity - 1;
      formQuantityInput.value = currentQuantity - 1;
    }
  }

  // Increase Quantity Button
  if (increaseQuantityButton) {
    increaseQuantityButton.addEventListener("click", increase);
  }
  function increase() {
    const currentQuantity = parseInt(quantityInput.value);
    const maxQuantity = parseInt(quantityInput.max);
    if (currentQuantity < maxQuantity) {
      quantityInput.value = currentQuantity + 1;
      formQuantityInput.value = currentQuantity + 1;
    }
  }

  if (quantityInput) {
    quantityInput.disabled = true;
    addToCartButton.disabled = true;
    decreaseQuantityButton.disabled = true;
    increaseQuantityButton.disabled = true;
  }
  

  // AI Aside functionality
  let aiBar = document.querySelector("#ai-aside");
  if (aiBar) {
    aiBar.style.display = "none";
  }

  let aiButton = document.querySelector("#ai-button");
  if (aiButton) {
    aiButton.addEventListener("click", toggleAIAside);
  }

  let closeButton = document.querySelector("#close-ai");
  if (closeButton) {
    closeButton.addEventListener("click", toggleAIAside);
  }

  function toggleAIAside() {
    const aiAside = document.getElementById("ai-aside");
    const isVisible = aiAside.classList.contains("animate");

    if (isVisible) {
      aiAside.classList.remove("animate");
      setTimeout(() => {
        aiAside.style.display = "none"; // Hide after animation
      }, 300); // Match the duration of the CSS transition
    } else {
      aiAside.style.display = "block"; // Show before animation starts
      setTimeout(() => {
        aiAside.classList.add("animate");
      }, 10); // Small timeout to allow display to take effect
    }
  }
});
