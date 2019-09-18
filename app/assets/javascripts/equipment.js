function getEquipmentReservations(){
    let reservationsDiv = document.getElementById('equipment-reservations');
    
    let url = window.location.href + ".json"
    
    fetch(url)
    .then(resp => resp.json())
    .then(info => {
        debugger;
        info.reservations.forEach(function(reservation){
            var objReservation = new Reservation(reservation);
            reservationsDiv.innerHTML += objReservation.displayReservation();
            
            // TODO: Fix - Displays Non Working ShowMoreInfo link
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