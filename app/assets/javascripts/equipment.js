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