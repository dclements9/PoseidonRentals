function getEquipmentReservations(){
    let reservationsDiv = document.getElementById('equipment-reservations');
    
    // Need equipment ID for below code.
    let url = window.location.href + ".json"
    
    fetch(url)
    .then(resp => resp.json())
    .then(info => {
        debugger;

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