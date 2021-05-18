import places from 'places.js';

const initAutocomplete = () => {
  const addressInput = document.getElementById('storage_space_address');
  if (addressInput) {
    places({ container: addressInput });
  }
};

export { initAutocomplete };
