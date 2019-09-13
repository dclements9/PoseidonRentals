
function listenForShowReservationsClick() {
    $('button#user-reservations').on('click', function(e){
        event.preventDefault()
        getReservations()
    })
}

function getReservations(){
    
}

class Reservation {
    constructor(reservation){
        this.id = reservation.id
        this.user_id = reservation.user_id
        this.equipment_id = reservation.equipment_id
        this.date = reservation.date
        this.start_time = reservation.start_time
        this.end_time = reservation.end_time
    }
}





function displayReservationForm(){
    let reservationForm = document.getElementById('reservation-form');
    let form = `
        <label> Test </label> 
    `
    reservationForm.innerHTML = form;
}