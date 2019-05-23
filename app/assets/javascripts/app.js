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



// Stop Event Bubbling when clicking child element 
$(function () {
    $(document).on("click", function (e) {
        e.stopPropagation();
    });
});

// Remove vehicle when clicking on "X" button
$(function () {
    $(document).on('click', '.vehicle.close-button', function () {
        const velicle_id = $(this).attr("id");
        debugger
        if (confirm("Are you sure you want to remove this vehicle?")) {
            $.ajax({
                type: "DELETE",

                // CSRF authenticity token
                beforeSend: function (xhr) { xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').attr('content')) },

                url: `/vehicles/${velicle_id}`,
            });
        }
        return false;
    });
});

// edit button renders edit view for vehicle
$(function () {
    $(document).on('click', '.vehicle.edit-button', function () {
        const vehicle_id = $(this).attr('id');
        window.location.href = `/vehicles/${vehicle_id}/edit`
    });
});


// Remove maintenance item when clicking on "X" button
$(function () {
    $(document).on('click', '.service.close-button', function (data) {
        const velicle_id = data.currentTarget.children[0].id;
        const maintenance_id = $(this).attr("id");
        if (confirm("Are you sure you want to remove this service?")) {
            $.ajax({
                type: "DELETE",

                // CSRF authenticity token
                beforeSend: function (xhr) { xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').attr('content')) },

                url: `/vehicles/${velicle_id}/maintenance_items/${maintenance_id}`,
            });
        }
        return false;
    });
});

// edit button renders edit view for vehicle
$(function () {
    $(document).on('click', '.service.edit-button', function (data) {
        const velicle_id = data.currentTarget.children[0].id;
        const maintenance_id = $(this).attr('id');
        window.location.href = `/vehicles/${velicle_id}/maintenance_items/${maintenance_id}/edit`
    });
});






