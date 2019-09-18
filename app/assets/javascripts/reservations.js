
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
        

        // TODO: href onClick is getting automatically clicked
        return(`
        <div>
            <h3> ${formatDate.toDateString()}</h3>
            <p> ${formatStart_time} to ${formatEnd_time}</p>
            <a href="#" onclick="${this.showMoreInfo()} return false;"> More Info </a>
        </div>
        `)
    }
    showMoreInfo(){
        let reservationInfoDiv = document.getElementById('user-reservations')
        let url = 'http://localhost:3000/reservations/' + this.id + '.json'

        fetch(url)
        .then(resp => resp.json())
        .then(info => {
        let reservationInfo = `
            <h1>Your Reservation for ${info.date}: </h1>
            
            <h2> Equipment: ${info.equipment.name} </h2>
            <h3> Cost: ${info.equipment.cost} </h3>

            <p>Pickup Time: </p>
            <p>Return Time: </p>
            `
            reservationInfoDiv.innerHTML = reservationInfo
        })
    }
}

function displayReservationForm(){
    displayEquipmentDropDown()

    let reservationForm = document.getElementById('reservation-form');
    let form = `
        <form onsubmit="createReservation(); return false;">
        <label> Date: </label>
        <input id="date" type="date">
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
            option.value = data[i].id
            dropdown.add(option);
            }    
        });  
        }  
    )  
    .catch(function(err) {  
        console.error('Fetch Error -', err);  
  });
}

function createReservation(){
    
    const reservation = {
        equipment_id: document.getElementById('equipment-select').value,
        date: document.getElementById('date').value,
        start_time: document.getElementById('start_time').value,
        end_time: document.getElementById('end_time').value
    }
    
    fetch("http://localhost:3000/reservations", {
        method: 'POST',
        headers:{
            'Content-Type': 'application/json',
            'Accept': 'application/json'
        },
        body: JSON.stringify({reservation})
    }).then(resp => resp.json())
    .then(reservation => {
        debugger;
        // displayReservation()
    })

}