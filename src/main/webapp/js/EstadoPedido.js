function alertaEntregado(codigoId, estado) {
    Swal.fire({
        icon: 'error',
        title: '&iquest;Desea cambiar el estado al pedido?',
        text: "El pedido esta en proceso, si  lo cambia a Entregado es porque esta todo bien.",
        padding: '2em 0',
        color: '#252121',
        backdrop: `rgba(78, 120, 252,0.3)`,
        confirmButtonColor: '#FF4B4B',
        confirmButtonText: 'Si!'
    }).then((result) => {
        if (result.isConfirmed) {
            console.log("index.jsp")
            window.location = ("../EjemploCarrito?codigoId=" + codigoId + "&action=" + estado);
        }
    });
}