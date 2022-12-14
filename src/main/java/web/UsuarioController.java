package web;

import dao.UsuarioDAO;
import java.io.IOException;
import java.io.PrintWriter;
import static java.lang.Integer.min;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.mail.MessagingException;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import vo.UsuarioVO;

@WebServlet(name = "UsuarioControlador", urlPatterns = {"/Usuario"})
public class UsuarioController extends HttpServlet {

    private String servidor, puerto, usuario, clave;

    public void init() {
        ServletContext contex = getServletContext();
        servidor = contex.getInitParameter("servidor");
        puerto = contex.getInitParameter("puerto");
        usuario = contex.getInitParameter("usuario");
        clave = contex.getInitParameter("clave");
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String codigoId = request.getParameter("codigoId");
        String action = request.getParameter("action");
        UsuarioVO UsuVO = new UsuarioVO(Integer.parseInt(codigoId), Boolean.valueOf(action));
        UsuarioDAO UsuaDAO = new UsuarioDAO(UsuVO);
        if (action.equals("true")) {
            if (UsuaDAO.Inactivar()) {
                String redirigirA = "";
                request.setAttribute("titleexito", "Usuario Inactivado Correctamente");
                request.getRequestDispatcher("admin/usuarios.jsp").forward(request, response);
            } else {
                request.setAttribute("titleerror", "El usuario no se pudo Inactivar");
                request.getRequestDispatcher("admin/usuarios.jsp").forward(request, response);
            }
        } else {
            if (UsuaDAO.Activar()) {
                request.setAttribute("titleexito", "Usuario Activado Correctamente");
                request.getRequestDispatcher("admin/usuarios.jsp").forward(request, response);
            } else {
                request.setAttribute("titleerror", "El usuario no se pudo Activar");
                request.getRequestDispatcher("admin/usuarios.jsp").forward(request, response);
            }

        }

    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String codigo = (request.getParameter("codigo"));
        String email = request.getParameter("email");
        String pass = request.getParameter("pass");
        String nombre = request.getParameter("nombre");
        String apellido = request.getParameter("apellido");
        String tipoDocu = request.getParameter("tipoDocu");
        String numDocu = request.getParameter("numDocu");
        String telefono = request.getParameter("telefono");
        String direccion = request.getParameter("direccion");
        String sexo = request.getParameter("sexo");
        String estado = request.getParameter("estado");
        String rol2 = request.getParameter("rol");
        //este rol tres es de cliente
        String rol = "3";
        //se dclaro estado unico, para quee siempre que se rgistre este en true
        String estadoUnico = "true";

        int action = Integer.parseInt(request.getParameter("action"));

        UsuarioVO usuarioVo = null;

        UsuarioDAO usuDAO = new UsuarioDAO();

        switch (action) {
            case 1: // Login
                if (request.getParameter("email").equals("") || request.getParameter("pass").equals("")) {
                    request.setAttribute("tituloError", "Error en los datos");
                    request.setAttribute("mensajeDescriptivo",
                            "Ning??n campo puede estar vac??o, completelos e intente nuevamente");
                    request.getRequestDispatcher("index.jsp").forward(request, response);
                } else {
                    usuarioVo = usuDAO.login(email, pass);
                    if (usuarioVo != null) {
                        HttpSession sesion = request.getSession();
                        sesion.setAttribute("usuarioVo", usuarioVo);
                        if (usuarioVo.isEstadoUsuario() == true) {
                            response.sendRedirect("menu.jsp");
                        } else {
                            request.setAttribute("tituloErrorr", "Tu estado actual esta INACTIVO");
                            request.setAttribute("mensajeDescriptivoo", "Tu estado es inactivo, comunicate con el administrador");
                            response.sendRedirect("index.jsp");
                        }

                    } else {
                        request.setAttribute("tituloError", "Error al iniciar sesion");
                        request.setAttribute("mensajeDescriptivo", "Las credenciales suministradas son err\u00f3neas, corr\u00EDjalas e intente nuevamente");
                        request.getRequestDispatcher("index.jsp").forward(request, response);
                    }
                }
                break;

            case 2: // insert del usuario cliente
            {
                usuarioVo = new UsuarioVO(email, pass, nombre, apellido, numDocu, telefono, direccion, sexo,
                        Boolean.parseBoolean(estadoUnico), rol, tipoDocu);
                usuDAO = new UsuarioDAO(usuarioVo);
                String resultado = "";
                String asunto = "Bienvenido!";
                String contenido = "<h1 style='font-family:sans-serif; font-size:20px; font-weight: bold;'>Registro Existoso!</h1>"
                        + "<p style='font-size: 17px;'>" + nombre + " " + apellido + " " + "te acabas de registrar a Variedades Ampi, inicia sesi??n y realiza tu pedido.<br> "
                        + "<a style='font-family: cursive;' href=\"http://localhost:8080/variedades-ampi/index.jsp\">Volver</a></p>";
                //SI ESTO RETORNA UN VERDADERO RETORNA UN MENSAJE EXITO
                try {
                    EnvioCorreo.enviarCorreo(servidor, puerto, usuario, clave, email, asunto, contenido);
                    if (usuDAO.signup()) {
                        request.setAttribute("mensajeExito", "Se??or(@)" + " " + nombre + " " + "se ha registrado correctamente");
                    } else {
                        request.setAttribute("mensajeError", "NO se ha podido registrar");
                    }
                    request.getRequestDispatcher("index.jsp").forward(request, response);
                } catch (MessagingException e) {
                    resultado = "Error de envio " + e.getMessage();
                    e.printStackTrace();
                }
            }
            break;

            case 3: // update
                HttpSession sessioon = request.getSession();
                UsuarioVO usuaaaVO = (UsuarioVO) sessioon.getAttribute("usuarioVo");
                UsuarioVO US = new UsuarioVO(email, pass, nombre, apellido, numDocu, telefono, direccion, sexo, Boolean.parseBoolean(estadoUnico), " ", tipoDocu);
                UsuarioDAO usuaaDAO = new UsuarioDAO(US);
                if (usuaaDAO.update()) {
                    request.getRequestDispatcher("admin/usuarios.jsp").forward(request, response);
                    request.setAttribute("mensajeExito", "Los datos se modificaron correctamente");

                } else {
                    request.setAttribute("mensajeError", "No se pudo actualizar el usuario");
                    System.out.println("Los datos son nulos");
                    request.getRequestDispatcher("admin/usuarios.jsp").forward(request, response);
                }
                break;

            case 4:
                UsuarioVO USUV = new UsuarioVO();
                UsuarioDAO USUD = new UsuarioDAO();
                UsuarioVO us = USUD.consultarId(Integer.parseInt(codigo));

                if (us.getIdRol().equals("1")) {
                    if (us != null) {
                        request.setAttribute("UsuarioR", us);
                        request.getRequestDispatcher("admin/").forward(request, response);
                    } else {
                        request.setAttribute("MensajeError", "No esta");
                        request.getRequestDispatcher("admin/").forward(request, response);
                    }
//                } else if (USUV.getIdRol().equals("2")) {
//                    if (us != null) {
//                        request.setAttribute("UsuarioR", us);
//                        request.getRequestDispatcher("vendedor/index.jsp").forward(request, response);
//                    } else {
//                        request.setAttribute("MensajeError", "No esta");
//                        request.getRequestDispatcher("vendedor/index.jsp").forward(request, response);
//                    }
//                } else if (USUV.getIdRol().equals("3")) {
//                    if (us != null) {
//                        request.setAttribute("UsuarioR", us);
//                        request.getRequestDispatcher("cliente/index.jsp").forward(request, response);
//                    } else {
//                        request.setAttribute("MensajeError", "No esta");
//                        request.getRequestDispatcher("cliente/index.jsp").forward(request, response);
//                    }
                } else {
                    request.setAttribute("MensajeError", "No esta el rol, no existe");
                }
                break;

            case 6:
                UsuarioDAO USUSDAO = new UsuarioDAO();
                UsuarioVO USUVO = USUSDAO.consultarId(Integer.parseInt(codigo));
                if (USUVO != null) {
                    request.setAttribute("ConsultadoUsuario", USUVO);
                    request.getRequestDispatcher("admin/usuarios.jsp").forward(request, response);
                } else {
                    request.setAttribute("MensajeError", "El usuario No esta");
                    request.getRequestDispatcher("admin/usuarios.jsp").forward(request, response);
                }
                break;
            case 8:
                UsuarioDAO USUDAO = new UsuarioDAO();
                String direccion2 = request.getParameter("email");
                String asunto2 = "Recuperacion de Contrase??a";
                HttpSession lasesion = request.getSession();
                String codigoVerificacion = USUDAO.generarNumeroAleatorio();
                lasesion.setAttribute("emailActualizar", direccion2);
                lasesion.setAttribute("codigoVerificacion", codigoVerificacion);

                String contenido2 = "Su Codigo de Verificacion es" + " " + codigoVerificacion + " " + "asegurese de suministrarlo  bien";
                String resultado = "";

                if (USUDAO.RecibirEmail(direccion2)) {
                    try {
                        EnvioCorreo.enviarCorreo(servidor, puerto, usuario, clave, direccion2, asunto2, contenido2);
                        request.setAttribute("MensajeEnviado", "true");
                        request.setAttribute("mensajeExito", "Porfavor mire el correo que suministro, el codigo de verificacion fue enviado.");
                        request.getRequestDispatcher("Recuperar.jsp").forward(request, response);

                    } catch (MessagingException e) {
                        e.printStackTrace();
                        request.setAttribute("mensajeError", "El codigo no se pudo enviar");
                        request.getRequestDispatcher("Recuperar.jsp").forward(request, response);
                    }
                } else {
                    request.setAttribute("mensajeError", "El correo no existe");
                    request.getRequestDispatcher("Recuperar.jsp").forward(request, response);
                }

                break;

            case 9://en este caso estamos comprobando que el codigo enviaado al correo sea correcto
                HttpSession obtener = request.getSession();
                String direcc = request.getParameter("codigoVerificacion");
                String codigoV = (String) obtener.getAttribute("codigoVerificacion");

                if (direcc.equals(codigoV)) {
//                    UsuarioDAO uusDAO = new UsuarioDAO();
                    request.setAttribute("mensajeExito", "Porfavor suministra la nueva contrase??a");
                    request.getRequestDispatcher("Password.jsp").forward(request, response);

                } else {
                    request.setAttribute("mensajeError", "El codigo no coincide con el enviado");
                    request.getRequestDispatcher("Recuperar.jsp").forward(request, response);
                }
                break;

            case 10:
                UsuarioDAO DAO = new UsuarioDAO();
                HttpSession obtenerr = request.getSession();
                String mail = (String) obtenerr.getAttribute("emailActualizar");
                String passs = request.getParameter("pass");
                if (DAO.recoverPassword(mail, passs)) {
                    request.setAttribute("mensajeExito", "Tu contrase&ntilde;a se ha recuperado.");
                    request.getRequestDispatcher("index.jsp").forward(request, response);

                } else {
                    request.setAttribute("mensajeError", "Tu contrase&ntilde;a NO se??pudo recuperar.");
                    request.getRequestDispatcher("Password.jsp").forward(request, response);

                }
                break;

            case 11: // insert para cuando el administrador crea un usuario
            {
                usuarioVo = new UsuarioVO(email, pass, nombre, apellido, numDocu, telefono, direccion, sexo,
                        Boolean.parseBoolean(estadoUnico), rol2, tipoDocu);
                usuDAO = new UsuarioDAO(usuarioVo);
                String resultadoo = "";
                String nuevorol = " ";
                String asunto3 = "Bienvenido!";
                if (rol2.equals("1")) {
                    nuevorol = "Administrador";
                } else if (rol2.equals("2")) {
                    nuevorol = "Vendedor";
                } else {
                    nuevorol = "desconocido";
                }
                String contenido3 = "<p style='font-family:sans-serif; font-size:20px; font-weight: bold;'>Hola" + " " + nombre + " " + apellido
                        + "</p><p>Te han registrado como" + " " + nuevorol + " "
                        + "y tu contrase??a para iniciar sesion es: <b>" + pass + " " + "</b></p><p>Recuerda cambiar tu contrase??a.</p>"
                        + "Disfruta <a href=\"http://localhost:8080/variedades-ampi/index.jsp\">Variedades Ampi</a>";
                //SI ESTO RETORNA UN VERDADERO RETORNA UN MENSAJE EXITO
                try {
                    EnvioCorreo.enviarCorreo(servidor, puerto, usuario, clave, email, asunto3, contenido3);
                    if (usuDAO.insert()) {
                        request.setAttribute("mensajeExitoo", "El usuario" + " " + nombre + " " + apellido + " " + "se registro correctamente");
                        request.getRequestDispatcher("admin/usuarios.jsp").forward(request, response);
                    } else {
                        request.setAttribute("mensajeErroro", "El usuario no se registro correctamente");
                        request.getRequestDispatcher("admin/usuarios.jsp").forward(request, response);
                    }

                } catch (MessagingException e) {
                    resultadoo = "Error de envio " + e.getMessage();
                    e.printStackTrace();
                }
            }
            break;
            case 12:
                UsuarioVO V = new UsuarioVO(email);
                UsuarioDAO usv = new UsuarioDAO(V);

                try ( PrintWriter out = response.getWriter()) {
                    if (usv.RecibirEmail(email)) {
                        out.print("El correo ya existe, pruebe con otro");
                    }else{
                        out.print("El correo es valido");
                    }

                } catch (IOException ex) {
                    System.out.println(" ex = " + ex);
                }
                break;
        }

    }
}
