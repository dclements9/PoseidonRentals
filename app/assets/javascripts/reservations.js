
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
    // TODO: Dropdown for equipment
    displayEquipmentDropDown()
    let reservationForm = document.getElementById('reservation-form');
    let form = `
        <form onsubmit="createReservation(); return false;">
        <label> Date: </label>
        <input type="date">
        <br>
        <label> Start Time: </label>
        <input id="start_time" type="time">
        <br>
        <label> End Time: </label>
        <input id="end_time" type="time">
        <br><br>
        <input type="submit" value="Create Reservation">
        </form>
        <br><br>
    `
    reservationForm.innerHTML = form;
}

function displayEquipmentDropDown(){
    let dropdown = document.getElementById('equipment-select');
    dropdown.length = 0;

    let defaultOption = document.createElement('option');
    defaultOption.text = 'Choose Equipment';

    dropdown.add(defaultOption);
    
    dropdown.selectedIndex = 0;
    
    const url = 'http://localhost:3000/equipment.json';

    fetch(url)  
    .then(  
        function(response) {   
        response.json().then(function(data) {  
            let option;
        
            for (let i = 0; i < data.length; i++) {
            option = document.createElement('option');
            option.text = data[i].name;
            dropdown.add(option);
            }    
        });  
        }  
    )  
    .catch(function(err) {  
        console.error('Fetch Error -', err);  
  });
}