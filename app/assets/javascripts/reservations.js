// Make Reservation a JS object

function getReservations(){
    let reservationsDiv = document.getElementById('user-reservations');
    fetch('http://localhost:3000/reservations.json')
    .then(resp => resp.json())
    .then(reservations => {
        reservationsDiv.innerHTML += "Success";
        let testReservation = new Reservation(reservations[0])

        reservationsDiv.innerHTML = testReservation.displayReservations();
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

    displayReservations(){
        return(`
        <div>
            <h3> ${this.date}</h3>
            <p> ${this.start_time} </p>
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