
function getReservations(){
    let reservationsDiv = document.getElementById('user-reservations');
    fetch('http://localhost:3000/reservations.json')
    .then(resp => resp.json())
    .then(reservations => {
        reservationsDiv.innerHTML = '';

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
        //TODO: proper converstion of timezone for displaying time.

        // If this.user_id == session[:user_id] - Access @user or session hash
        // --- Should this happen in controller? For security API validations

        // Converts Ruby Date Type to formatted string date.
        var dateParts = this.date.split('-');
        var formatDate = new Date (dateParts[0], (dateParts[1] - 1), dateParts[2])
        
        //Converts Ruby Date (Time) Type to formatted string time.
        
        var formatStart_time = (new Date(this.start_time)).toLocaleTimeString([], {hour: '2-digit', minute:'2-digit'});

        var formatEnd_time = (new Date(this.end_time)).toLocaleTimeString([], {hour: '2-digit', minute:'2-digit'});

        return(`
        <div>
            <h3> ${formatDate.toDateString()}</h3>
            <p> ${formatStart_time} to ${formatEnd_time}</p>
            <p> ${this.equipment.name} </p>
        </div>
        `)
    }
}

function displayReservationForm(){
    let reservationForm = document.getElementById('reservation-form');
    let form = `
        <form onsubmit="createReservation(); return false;">
        <label> Test </label>
        <input type="time">
        <input type="submit" value="Create Reservation">
        </form>
    `
    reservationForm.innerHTML = form;
}