const priceCalculation = (endDate,startDate,price) => {
  return (Math.abs(endDate - startDate)/(1000 * 3600 * 24) + 1) * price;
};

const initBookingPriceCalculation = () => {
  const bookingPrice = document.getElementById('total-booking-price');
  const bookingPricePerDay = document.getElementById('booking-price-per-day')
  const bookingEndDate = document.getElementById('booking_end_date');
  const bookingStartDate = document.getElementById('booking_start_date');
  const pricePerDay = document.getElementById('price-field');
  const bookingTotalDays = document.getElementById('total-booking-days')
  bookingPricePerDay.innerHTML = parseFloat(pricePerDay.innerHTML);

  bookingEndDate.addEventListener("input", () => {
    const endDate = new Date(bookingEndDate.value);
    const startDate = new Date(bookingStartDate.value);
    bookingTotalDays.innerHTML = (Math.abs(endDate - startDate)/(1000 * 3600 * 24) + 1);
    bookingPrice.innerHTML = priceCalculation(endDate,startDate,parseFloat(pricePerDay.innerHTML));
  });
};

export { initBookingPriceCalculation };
