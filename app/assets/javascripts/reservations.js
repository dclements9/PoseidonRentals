
function getReservations(){
    let reservationsDiv = document.getElementById('user-reservations');
    fetch('http://localhost:3000/reservations.json')
    .then(resp => resp.json())
    .then(reservations => {
        reservationsDiv.innerHTML += "Success";

        for (var i = 0, len = reservations.length; i < len; ++i) {
            
            var objReservation = new Reservation(reservations[i]);
            reservationsDiv.innerHTML += objReservation.displayReservation();
            
        }
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
        this.equipment = reservation.equipment
        
    }

    displayReservation(){
        // If this.user_id == session[:user_id] - Access @user or session hash

        // Converts Ruby Date Type to formatted string time.
        var dateParts = this.date.split('-');
        var formatDate = new Date (dateParts[0], (dateParts[1] - 1), dateParts[2])
        
        return(`
        <div>
            <h3> ${formatDate.toDateString()}</h3>
            <p> ${this.start_time} </p>
            <p> ${this.equipment.name} </p>
        </div>
        `)
    }
}

function displayReservationForm(){
    let reservationForm = document.getElementById('reservation-form');
    let form = `
        <label> Test </label> 
    `
    reservationForm.innerHTML = form;
}