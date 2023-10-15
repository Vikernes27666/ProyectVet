<%@page import="java.util.ArrayList"%>
<%@page import="Modelo.Citas"%>
<%@page import="dao.CitaDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="basededatos.*" %>
<%@page import="java.sql.*" %>
<%

    Conexion c = new Conexion();
    CitaDAO citaDao = new CitaDAO();
    String searchTerm = request.getParameter("searchTerm"); // Obtiene el término de búsqueda
    if (searchTerm == null) {
        searchTerm = ""; // Establece el término de búsqueda en una cadena vacía si es nulo
    }
    ArrayList<Citas> listaCitas = citaDao.obtenerCitasPorTexto(searchTerm);
    System.out.println(searchTerm);
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Citas</title>
        <script src="Script/Slidebar.js" defer></script>
        <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <link href="estilosCSS/Slidebar.css" rel="stylesheet">
        <link href='https://unpkg.com/boxicons@2.0.9/css/boxicons.min.css' rel='stylesheet'>
        <link href="estilosCSS/Contenedor.css" rel="stylesheet">
        <link href="estilosCSS/Enlaces.css" rel="stylesheet">
        <link href="estilosCSS/Citas.css" rel="stylesheet">
        <script src="javascript/CitasModal.js" defer ></script>
        <script src="javascript/CitaModalEditar.js" defer ></script>
    </head>
    <body>
        <header class="wrapperlado">
            <div class="menu-dashboard">
                <!-- TOP MENU -->
                <div class="top-menu">
                    <div class="logo">
                        <img src="imagenes/huellas.png" alt="">
                        <span><font size="4">VETERINARIA AMIGO</font></span>
                    </div>
                    <div class="toggle">
                        <i class='bx bx-menu'></i>
                    </div>
                </div>
                <!-- INPUT SEARCH -->
                <div class="input-search">
                    <i class='bx bx-search'></i>
                    <input type="text" class="input" placeholder="Buscar">
                </div>
                <!-- MENU -->
                <div class="menu">
                    <div class="enlace">
                        <i class="bx bx-grid-alt"></i>
                        <span>Panel</span>
                    </div>

                    <div class="enlace">
                        <i class="bx bx-user"></i>
                        <span>
                            <a class="slidebotones" href="Perfil.jsp">Perfil</a>
                        </span>
                    </div>

                    <div class="enlace">
                        <i class='bx bx-calendar-plus' ></i>
                        <span>
                            <a class="slidebotones" href="Citas.jsp">Citas</a>
                        </span>
                    </div>
                    <div class="enlace">
                        <i class='bx bx-calendar' ></i>
                        <span>
                            <a class="slidebotones" href="Calendario.jsp">Calendario</a>
                        </span>
                    </div>

                    <div class="enlace">
                        <i class='bx bxs-face'></i>
                        <span>
                            <a class="slidebotones" href="Clientes.jsp">Clientes</a>
                        </span>
                    </div> 

                    <div class="enlace">
                        <i class="bx bx-bone"></i>
                        <span>
                            <a class="slidebotones" href="Mascotas.jsp">Mascotas</a>
                        </span>
                    </div> 

                    <div class="enlace">
                        <i class="bx bx-shield-alt-2"></i>
                        <span>
                            <a class="slidebotones" href="Medicamentos.jsp">Medicamentos</a>
                        </span>
                    </div>

                    <div class="enlace">
                        <i class="bx bx-cube"></i>
                        <span>
                            <a class="slidebotones" href="Accesorios.jsp">Accesorios</a>
                        </span>
                    </div>                 

                    <div class="enlace">
                        <i class="bx bx-cog"></i>
                        <span>Configuración</span>
                    </div>

                    <div class="enlace">
                        <i class='bx bx-log-out' ></i>
                        <span>
                            <a class="slidebotones" href="Login.jsp">Salir</a>
                        </span>
                    </div>
                </div>
            </div>
        </header>
        <div class="wrapper">
            <div class="wrap">
                <h1>CITAS</h1>
                <!-- Botón para agregar una nueva cita -->
                <div class="boton">
                    <button id="btnAgregarCita" class="btn btn-primary">Agregar Cita</button>
                </div>
                <!-- Formulario de búsqueda de Citas -->
                <div class="boton">
                    <form action="Citas.jsp" method="GET" class="form-inline">
                        <div class="input-group">
                            <input type="text" name="searchTerm" class="form-control" placeholder="Buscar Cita" value="<%= searchTerm%>">
                            <span class="input-group-btn">
                                <button class="btn btn-primary" type="submit">Buscar</button>
                            </span>
                        </div>
                    </form>
                </div>
                <!-- Tabla para mostrar los datos existentes -->
                <table class="table table-bordered" id="tablaDatos">
                    <thead>
                        <tr>
                            <th class="text-center" width="50">ID</th>
                            <th class="text-center" width="200">Razón de la cita</th>
                            <th class="text-center" width="100">Fecha de la cita</th>
                            <th class="text-center" width="100">DNI del Cliente</th>
                            <th class="text-center" width="100">Nombre del Cliente</th>
                            <th class="text-center" width="50">ID de la Mascota</th>
                            <th class="text-center" width="100">Nombre de Mascota</th>
                            <th class="text-center" width="50">Raza de Mascota</th>
                            <th class="text-center" width="50">Especie de Mascota</th>
                            <th class="text-center" width="100">Estado</th>
                            <th class="text-center" width="200">Acciones</th>
                        </tr>
                    </thead>
                    <tbody id="tbodys">
                        <% for (Citas cita : listaCitas) {%>
                        <tr>
                            <td class="text-center"><%= cita.getID()%></td>
                            <td><%= cita.getRazonCita()%></td>
                            <td class="text-center"><%= cita.getFechaCita()%></td>
                            <td class="text-center"><%= cita.getDniCliente()%></td>
                            <td class="text-center"><%= cita.getMascota().getCliente().getNombre()%></td>
                            <td class="text-center"><%= cita.getIdMascota()%></td>
                            <td class="text-center"><%= cita.getMascota().getNombreAnimal()%></td>
                            <td class="text-center"><%= cita.getMascota().getRaza()%></td>
                             <td class="text-center"><%= cita.getMascota().getEspecie() %></td>
                            <td class="text-center">
                                <%
                                    String estado = cita.getEstado();
                                    String estadoClass = "btn-warning"; // Naranja por defecto
                                    if (estado.equals("Pendiente")) {
                                        estadoClass = "btn-warning"; // Naranja
                                    } else if (estado.equals("Atendida")) {
                                        estadoClass = "btn-success"; // Verde
                                    } else if (estado.equals("Cancelada")) {
                                        estadoClass = "btn-danger"; // Rojo
                                    }
                                %>
                                <button class="btn <%= estadoClass%>"><%= estado%></button>
                            </td>
                            <td class="text-center">
                                <table>
                                    <tr>
                                        <td style="padding-right: 10px;"><a class="btn btn-primary" onclick="editarCita(<%= cita.getID()%>)">Editar</a></td>
                                        <td style="padding-right: 10px;"><a class="btn btn-danger" onclick="eliminarCita(<%= cita.getID()%>)">Eliminar</a></td>
                                    </tr>
                                </table>
                            </td>

                        </tr>
                        <% }%>
                    </tbody>
                </table>
                <!-- Modal para Agendar Cita -->
                <div id="modalAgendarCita" class="modal">
                    <div class="modal-content">
                        <h2>Agendar Nueva Cita</h2>
                        <div class="formulario-agregar">
                            <form action="AgendarCitaServlet" method="POST">
                                <div class="form-group">
                                    <label for="razonCita">Razón de la cita:</label>
                                    <input type="text" name="razonCita" id="razonCita" class="form-control" required>
                                </div>
                                <div class="form-group">
                                    <label for="fechaCita">Fecha de la cita:</label>
                                    <input type="date" name="fechaCita" id="fechaCita" class="form-control" required>
                                </div>
                                <div class="form-group">
                                    <label for="dniCliente">DNI del Cliente:</label>
                                    <select name="dniCliente" id="dniCliente" class="form-control" required>
                                        <option value="">Selecciona un DNI</option>
                                        <%
                                            ResultSet clientes = c.smt.executeQuery("SELECT DNI FROM clientes");
                                            while (clientes.next()) {
                                                String dni = clientes.getString("DNI");
                                        %>
                                        <option value="<%= dni%>"><%= dni%></option>
                                        <%
                                            }
                                        %>
                                    </select>
                                </div>
                                <div class="form-group">
                                    <label for="idMascota">ID de la Mascota:</label>
                                    <select name="idMascota" id="idMascota" class="form-control" required>
                                        <option value="">Selecciona un ID de Mascota</option>
                                        <%
                                            ResultSet mascotas = c.smt.executeQuery("SELECT ID FROM mascotas");
                                            while (mascotas.next()) {
                                                int idMascota = mascotas.getInt("ID");
                                        %>
                                        <option value="<%= idMascota%>"><%= idMascota%></option>
                                        <%
                                            }
                                        %>
                                    </select>
                                </div>
                                <button type="submit" class="btn btn-primary">Agendar Cita</button>
                            </form>
                        </div>
                    </div>
                </div>

                <!-- Modal para editar Cita -->                   
                <div id="modalEditarCita" class="modal">
                    <div class="modal-content">
                        <h2>Editar Cita</h2>
                        <div class="formulario-agregar">
                            <form action="EditarCitaServlet" method="POST">
                                <input type="hidden" id="editarCitaId" name="editarCitaId" value="">
                                <div class="form-group">
                                    <label for="editarRazonCita">Razón de la cita:</label>
                                    <input type="text" name="editarRazonCita" id="editarRazonCita" class="form-control" required>
                                </div>
                                <div class="form-group">
                                    <label for="editarFechaCita">Fecha de la cita:</label>
                                    <input type="date" name="editarFechaCita" id="editarFechaCita" class="form-control" required>
                                </div>
                                <div class="form-group">
                                    <label for="editarDniCliente">DNI del Cliente:</label>
                                    <select name="editarDniCliente" id="editarDniCliente" class="form-control" required>
                                        <option value="">Selecciona un DNI</option>
                                        <%
                                            ResultSet clientesEditar = c.smt.executeQuery("SELECT DNI FROM clientes");
                                            while (clientesEditar.next()) {
                                                String dniEditar = clientesEditar.getString("DNI");
                                        %>
                                        <option value="<%= dniEditar%>"><%= dniEditar%></option>
                                        <%
                                            }
                                        %>
                                    </select>
                                </div>
                                <div class="form-group">
                                    <label for="editarIdMascota">ID de la Mascota:</label>
                                    <select name="editarIdMascota" id="editarIdMascota" class="form-control" required>
                                        <option value="">Selecciona un ID de Mascota</option>
                                        <%
                                            ResultSet mascotasEditar = c.smt.executeQuery("SELECT ID FROM mascotas");
                                            while (mascotasEditar.next()) {
                                                int idMascotaEditar = mascotasEditar.getInt("ID");
                                        %>
                                        <option value="<%= idMascotaEditar%>"><%= idMascotaEditar%></option>
                                        <%
                                            }
                                        %>
                                    </select>
                                </div>
                                <div class="form-group">
                                    <label for="editarEstado">Estado:</label>
                                    <select name="editarEstado" id="editarEstado" class="form-control" required>
                                        <option value="Pendiente">Pendiente</option>
                                        <option value="Atendida">Atendida</option>
                                        <option value="Cancelada">Cancelada</option>
                                    </select>
                                </div>
                                <button type="submit" class="btn btn-primary">Guardar Cambios</button>
                            </form>
                        </div>
                    </div>
                </div>



                <!-- Botones de exportar a PDF y Excel -->
                <div class="boton">
                    <button class="btn btn-info">Exportar a PDF</button>
                    <button class="btn btn-success">Exportar a Excel</button>
                </div>
            </div>
        </div>
    </body>
</html>
