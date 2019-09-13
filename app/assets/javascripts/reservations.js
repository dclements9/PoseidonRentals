// Make Reservation a JS object

function getReservations(){
    let reservationsDiv = document.getElementById('user-reservations');
    fetch('http://localhost:3000/reservations.json')
    .then(resp => resp.json())
    .then(reservations => {
        reservationsDiv.innerHTML += "Success";
        
        debugger;
    })

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