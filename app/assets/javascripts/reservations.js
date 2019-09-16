
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
        debugger;
    }

    displayReservation(){
        // If this.user_id == session[:user_id] - Access @user or session hash
        return(`
        <div>
            <h3> ${this.date.date}</h3>
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