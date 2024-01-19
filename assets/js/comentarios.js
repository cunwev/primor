document.addEventListener('DOMContentLoaded',function(){
    fetch('http://localhost/trabajo/index.php?controller=api&action=mostrarComentarios',{
        method: 'POST',
        headers: {
            'Content-Type': 'application/json; charset=UTF-8',
        },
    })
    .then(response => {
        return response.json();
    })
    .then(data => {
        consoleYEET(data);
    })
    .catch(error => {
        console.error(error);
    })
})


function consoleYEET(data){
    console.log(data);
}