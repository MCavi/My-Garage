$(document).foundation()

// click listener to link back to garage page
$(document).on("click", "#garage", () => {
        window.location.href = "/vehicles"
    });

$(document).on("click", '.vehicle-items', (data) => {
    // Change URL to vehicle show page on click
        vehicleId = parseInt(data.currentTarget.id);
        window.location.href = `/vehicles/${vehicleId}`;
    });

// Stop Event Bubbling when clicking child element
$(document).on("click", '.xdf', function (e) {
    e.stopPropagation();
});

$(document).ready(() => {
    // Using jquery autocomplete to search through an array
    // of possible vehilce makes 
    $(function ($) {
        $("#make").autocomplete({
            source: vehicleMakes,

            // autofocus selects first menu item by default
            autoFocus: true,
        });
    });



    // Array of some vehicle makes
    const vehicleMakes = [
        "Audi",
        "Aston Martin",
        "Alfa Romeo",
        "Bentley",
        "BMW",
        "Mercedes-Benz",
        "Ferrari",
        "Jaguar",
        "Volkswagen",
        "Porsche",
        "Sabb",
        "Volvo",
        "Fiat",
        "Ford",
        "Jeep",
        "GMC",
        "Tesla",
        "Nissan",
        "Toyota",
        "Honda",
        "Mazda",
        "Lexus",
        "Subaru"];
;})




