function getEquipment(){
    let url = window.location.href + ".json"  
    let equipmentDiv = document.getElementById('equipment-div');

    fetch(url)
    .then(resp => resp.json())
    .then(equipment => {
        let cost = parseFloat(equipment.cost)

        equipmentDiv.innerHTML += `<h1>${equipment.name}<br></h1>`
        equipmentDiv.innerHTML += `<h3>Category: ${equipment.category}<br> </h3>`
        equipmentDiv.innerHTML += `<h3>Cost: $${cost.toFixed(2)}<br> </h3>`
        equipmentDiv.innerHTML += `<h3>Available: ${equipment.available ? "Yes" : "No"} </h3>`
    })
}

function getEquipmentReservations(){
    let reservationsDiv = document.getElementById('equipment-reservations');
    
    let url = window.location.href + ".json"
    
    fetch(url)
    .then(resp => resp.json())
    .then(info => {
        info.reservations.forEach(function(reservation){
            var objReservation = new Reservation(reservation); 
            objReservation.equipment_id = document.cookie.replace(/(?:(?:^|.*;\s*)equipment_id\s*\=\s*([^;]*).*$)|^.*$/, "$1")            
            reservationsDiv.innerHTML += objReservation.displayReservation();
        })
    })
}


class Equipment{
    constructor(equipment){
        this.name = equipment.id
        this.category = equipment.category
        this.available = equipment.available
        this.cost = equipment.cost
    }
}