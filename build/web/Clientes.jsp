<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="basededatos.*" %>
<%@page import="java.sql.*" %>
<% 
   Conexion c = new Conexion(); // Crear la conexión a la base de datos
   ResultSet ListaClientes = c.smt.executeQuery("SELECT DNI, Nombre FROM clientes");
   
   String searchTerm = request.getParameter("searchTerm"); // Obtener el término de búsqueda
   if (searchTerm == null) {
       searchTerm = ""; // Establecer el término de búsqueda en una cadena vacía si es nulo
   }
%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Atenciones</title>
      <script src="Script/Slidebar.js" defer ></script>
    <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
    <link href="estilosCSS/Slidebar.css" rel="stylesheet">
    <link href='https://unpkg.com/boxicons@2.0.9/css/boxicons.min.css' rel='stylesheet'>
    <link href="estilosCSS/Contenedor.css" rel="stylesheet">
    <link href="estilosCSS/Enlaces.css" rel="stylesheet">
    <link href="estilosCSS/Perfil.css" rel="stylesheet">
    <script src="javascript/PerfilModal.js" defer ></script>
    <script src="javascript/PerfilEditar.js" defer ></script>
    <script src="javascript/PerfilEliminar.js" defer ></script>
    <script src="javascript/ClienteEliminar.js" defer ></script>
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
            <h1>CLIENTES</h1>
            <!-- Botón para agregar un nuevo cliente -->
             <button id="btnAgregarPerfil" class="btn btn-primary">Agregar Cliente</button>

            <!-- Modal para agregar perfil -->
            <div id="modalAgregarPerfil" class="modal">
                <div class="modal-content">
                    <h2>Agregar Nuevo Cliente</h2>
                    <div class="formulario-agregar">
                        <form action="AgregarClienteServlet" method="POST">
                            <div class="form-group">
                                <label for="DNI">DNI</label>
                                <input type="text" name="DNI" id="DNI" class="form-control" required>
                            </div>
                            <div class="form-group">
                                <label for="Nombre">Nombre</label>
                                <input type="text" name="Nombre" id="Nombre" class="form-control" required>
                            </div>
                            <button type="submit" class="btn btn-primary">Agregar Cliente</button>
                        </form>
                    </div>
                </div>
            </div>
            <!-- Formulario de búsqueda de clientes -->
            <div class="boton">
                <form action="clientes.jsp" method="GET" class="form-inline">
                    <div class="input-group">
                        <input type="text" name="searchTerm" class="form-control" placeholder="Buscar Cliente" value="<%= searchTerm %>">
                        <span class="input-group-btn">
                            <button class="btn btn-primary" type="submit">Buscar</button>
                        </span>
                    </div>
                </form>
            </div>
            <table class="table table-bordered" id="tablaClientes">
                <thead>
                    <tr>
                        <th class="text-center" width="120">DNI</th>
                        <th class="text-center" width="200">Nombre del Cliente</th>
                        <th class="text-center" width="200">Acciones</th>
                    </tr>
                </thead>
                <tbody id="tbodysClientes">
                    <% while (ListaClientes.next()) {%>
                    <tr>
                        <td class="text-center"><%= ListaClientes.getString("DNI")%></td>
                        <td><%= ListaClientes.getString("Nombre")%></td>
                        <td class="text-center">
                            <!-- Botones para editar y eliminar cliente -->
                            <a class="btn btn-primary" onclick="editarCliente(<%= ListaClientes.getString("DNI")%>)">Editar</a>
                            <a class="btn btn-danger" onclick="eliminarCliente('<%= ListaClientes.getString("DNI")%>')">Eliminar</a>

                        </td>
                    </tr>
                    <% }%>
                </tbody>
            </table>
            <!-- Otros elementos y funcionalidades que desees agregar para gestionar clientes -->
        </div>
    </div>
</body>
</html>