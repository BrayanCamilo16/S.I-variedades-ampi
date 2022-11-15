//FUNCION PRINCIPAL
$(document).ready(function () {
    $("tr #btnDelete").click(function () {
        //AQUI SE CAPTURA EL ID DE LA FILA SELECCIONADA
        var idP = $(this).parent().find("#idP").val();
        eliminar(idP);
//        swal({
//            title: "¿Desea quitar ese producto del carrito?",
//            text: "Once deleted, you will not be able to recover this imaginary file!",
//            icon: "warning",
//            buttons: true,
//            dangerMode: true
//        })
//                .then((willDelete) => {
//                    if (willDelete) {
//                        eliminar(idP);
//                        swal("Poof! Your imaginary file has been deleted!", {
//                            icon: "success"
//                        }).then((willDelete) => {
//                            if (willDelete) {
//                                parent.location.href = "EjemploCarrito?accion=Carrito";
//                            }
//                        });
//                    } else {
//                        swal("Producto no eliminado");
//                    }
//                });
    });
    function eliminar(idP) {
        var url = "EjemploCarrito?accion=Delete";
        $.ajax({
            type: 'POST',
            url: url,
            data: "idP=" + idP,
            success: function (data, textStatus, jqXHR) {
                alert("Registro eliminado");
            }
        });
    }
});
