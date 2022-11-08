function alertaInactivarP(codigoId, estado) {
    Swal.fire({
        icon: 'error',
        title: '&iquest;Desea Inactivar el Producto?',
        text: "Una vez inactiva el producto, este ya no podra estar en lista.",
        padding: '2em 0',
        color: '#252121',
        backdrop: `rgba(78, 120, 252,0.3)`,
        confirmButtonColor: '#FF4B4B',
        confirmButtonText: 'Si, Inactivar!'
    }).then((result) => {
        if (result.isConfirmed) {
            console.log("index.jsp")
            window.location = ("../Producto?codigoId=" + codigoId + "&action=" + estado);
        }
    });
}

function alertaActivarP(codigoId, estado) {
    Swal.fire({
        icon: 'success',
        title: '&iquest;Desea Activar el Producto?',
        text: "Una vez Activa el producto, este podra estar en lista.",
        padding: '2em 0',
        color: '#252121',
        backdrop: `rgba(78, 120, 252,0.3)`,
        confirmButtonColor: '#0059FF',
        confirmButtonText: 'Si, Activar!'
    }).then((result) => {
        if (result.isConfirmed) {
            console.log("index.jsp")
            window.location = ("../Producto?codigoId=" + codigoId + "&action=" + estado);
        }
    });
}