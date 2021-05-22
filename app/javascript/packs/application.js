// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

//import Rails from "@rails/ujs"
require("@rails/ujs").start()
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"

//Rails.start()
Turbolinks.start()
ActiveStorage.start()


// ----------------------------------------------------
// Note(lewagon): ABOVE IS RAILS DEFAULT CONFIGURATION
// WRITE YOUR OWN JS STARTING FROM HERE 👇
// ----------------------------------------------------

// External imports
import "bootstrap";

// Flatpickr
import flatpickr from "flatpickr";
require("flatpickr/dist/flatpickr.css")

//StarRating
import { initStarRating } from '../plugins/star_rating';
import 'jquery-bar-rating/dist/themes/css-stars';

//MapBox
import 'mapbox-gl/dist/mapbox-gl.css';
import '@mapbox/mapbox-gl-geocoder/dist/mapbox-gl-geocoder.css';
import { initMapbox } from '../plugins/init_mapbox';
import { initAutocomplete } from '../plugins/init_autocomplete';

//PriceCalculation
import { initBookingPriceCalculation } from '../plugins/booking_price_calculation';

document.addEventListener('turbolinks:load', () => {
  initMapbox();
  initAutocomplete();
  initStarRating();
  flatpickr("#booking_start_date", {});
  flatpickr("#booking_end_date", {});
  initBookingPriceCalculation();
})
