<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="basededatos.*" %>
<%@page import="java.sql.*" %>
<%
   Conexion c = new Conexion(); // Crear la conexión a la base de datos
   ResultSet ListaMascotas = c.smt.executeQuery("SELECT ID, NombreAnimal, SexoAnimal, Raza, Color, Especie, DniCliente FROM mascotas");
   
   String searchTerm = request.getParameter("searchTerm"); // Obtener el término de búsqueda
   if (searchTerm == null) {
       searchTerm = ""; // Establecer el término de búsqueda en una cadena vacía si es nulo
   }
%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Mascotas</title>
    <script src="Script/Slidebar.js" defer ></script>
    <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
    <link href="estilosCSS/Slidebar.css" rel="stylesheet">
    <link href='https://unpkg.com/boxicons@2.0.9/css/boxicons.min.css' rel='stylesheet'>
    <link href="estilosCSS/Contenedor.css" rel="stylesheet">
    <link href="estilosCSS/Enlaces.css" rel="stylesheet">
    <link href="estilosCSS/Mascotas.css" rel="stylesheet">
    <script src="javascript/MascotasModal.js" defer ></script>
    <script src="javascript/MascotaEliminar.js" defer ></script>
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
            <h1>MASCOTAS</h1>
            <!-- Botón para agregar una nueva mascota -->
            <div class="boton">
                <button id="btnAgregarMascota" class="btn btn-primary">Agregar Mascota</button>
            </div>
            <!-- Formulario de búsqueda de mascotas -->
            <div class="boton">
                <form action="mascotas.jsp" method="GET" class="form-inline">
                    <div class="input-group">
                        <input type="text" name="searchTerm" class="form-control" placeholder="Buscar Mascota" value="<%= searchTerm%>">
                        <span class="input-group-btn">
                            <button class="btn btn-primary" type="submit">Buscar</button>
                        </span>
                    </div>
                </form>
            </div>
            <!-- Tabla para mostrar los datos existentes -->
            <table class="table table-bordered" id="tablaMascotas">
                <thead>
                    <tr>
                        <th class="text-center" width="120">ID</th>
                        <th class="text-center" width="200">Nombre de la mascota</th>
                        <th class="text-center" width="200">Sexo del animal</th>
                        <th class="text-center" width="200">Raza</th>
                        <th class="text-center" width="200">Color</th>
                        <th class="text-center" width="200">Especie</th>
                        <th class="text-center" width="200">Dueño (DNI)</th>
                        <th class="text-center" width="200">Acciones</th>
                    </tr>
                </thead>
                <tbody id="tbodysMascotas">
                    <% while (ListaMascotas.next()) {%>
                    <tr>
                        <td class="text-center"><%= ListaMascotas.getInt("ID")%></td>
                        <td><%= ListaMascotas.getString("NombreAnimal")%></td>
                        <td><%= ListaMascotas.getString("SexoAnimal")%></td>
                        <td><%= ListaMascotas.getString("Raza")%></td>
                        <td><%= ListaMascotas.getString("Color")%></td>
                        <td><%= ListaMascotas.getString("Especie")%></td>
                        <td><%= ListaMascotas.getString("DniCliente")%></td>
                        <td class="text-center">
                            <!-- Botones para editar y eliminar mascota -->
                            <a class="btn btn-primary" href="editar_mascota.jsp?ID=<%= ListaMascotas.getInt("ID")%>">Editar</a>
                            <a class="btn btn-danger" onclick="eliminarMascota(<%= ListaMascotas.getInt("ID")%>)">Eliminar</a>
                        </td>
                    </tr>
                    <% }%>
                </tbody>
            </table>



            <!-- modal -->
            <div id="modalAgregarMascota" class="modal">
                <div class="modal-content">
                    <h2>Agregar Nueva Mascota</h2>
                    <div class="formulario-agregar">
                        <form action="AgregarMascotaServlet" method="POST">
                            <div class="form-group">
                                <label for="nombreMascota">Nombre de la mascota:</label>
                                <input type="text" name="nombreMascota" id="nombreMascota" class="form-control" required>
                            </div>
                            <div class="form-group">
                                <label for="sexoMascota">Sexo de la mascota:</label>
                                <input type="text" name="sexoMascota" id="sexoMascota" class="form-control" required>
                            </div>
                            <div class="form-group">
                                <label for="raza">Raza:</label>
                                <input type="text" name="raza" id="raza" class="form-control" required>
                            </div>
                            <div class="form-group">
                                <label for="color">Color:</label>
                                <input type="text" name="color" id="color" class="form-control" required>
                            </div>
                            <div class="form-group">
                                <label for="especie">Especie:</label>
                                <input type="text" name="especie" id="especie" class="form-control" required>
                            </div>
                            <div class="form-group">
                                <label for="dniCliente">DNI del dueño:</label>
                                <select name="dniCliente" id="dniCliente" class="form-control" required>
                                    <option value="">Selecciona un DNI</option>
                                    <%
                                        ResultSet propietarios = c.smt.executeQuery("SELECT DNI FROM clientes");
                                        while (propietarios.next()) {
                                            String dni = propietarios.getString("DNI");
                                    %>
                                    <option value="<%= dni%>"><%= dni%></option>
                                    <%
                                        }
                                    %>
                                </select>
                            </div>
                            <button type="submit" class="btn btn-primary">Agregar Mascota</button>
                        </form>
                    </div>
                </div>
            </div>


        </div>
    </div>
</body>
</html>
