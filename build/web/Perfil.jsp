<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="basededatos.*" %>
<%@ page import="java.sql.*" %>
<% 
   Conexion c = new Conexion(); // Crea la conexión a la base de datos
   // Ejecuta la consulta para obtener la lista de perfiles
   ResultSet ListaPerfiles = c.smt.executeQuery("SELECT ID, nombre, telefono, usuario, contrasena, cargo FROM usuarios");
   

   String searchTerm = request.getParameter("searchTerm"); // Obtiene el término de búsqueda
   if (searchTerm == null) {
       searchTerm = ""; // Establece el término de búsqueda en una cadena vacía si es nulo
   }
   
%>

<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Perfiles</title>
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
            <h1>PERFILES</h1>

            <!-- Botón para abrir el modal -->
            <button id="btnAgregarPerfil" class="btn btn-primary">Agregar Perfil</button>

            <!-- Modal para agregar perfil -->
            <div id="modalAgregarPerfil" class="modal">
                <div class="modal-content">
                    <h2>Agregar Nuevo Perfil</h2>
                    <div class="formulario-agregar">
                        <form action="AgregarPerfilServlet" method="POST">
                            <div class="form-group">
                                <label for="nombre">Nombre:</label>
                                <input type="text" name="nombre" id="nombre" class="form-control" required>
                            </div>
                            <div class="form-group">
                                <label for="telefono">Teléfono:</label>
                                <input type="text" name="telefono" id="telefono" class="form-control" required>
                            </div>
                            <div class="form-group">
                                <label for="usuario">Usuario:</label>
                                <input type="text" name="usuario" id="usuario" class="form-control" required>
                            </div>
                            <div class="form-group">
                                <label for="contrasena">Contraseña:</label>
                                <input type="password" name="contrasena" id="contrasena" class="form-control" required>
                            </div>
                            <div class="form-group">
                                <label for="cargo">Cargo:</label>
                                <input type="text" name="cargo" id="cargo" class="form-control" required>
                            </div>
                            <button type="submit" class="btn btn-primary">Agregar Perfil</button>
                        </form>
                    </div>
                </div>
            </div>



            
            <!-- Formulario de búsqueda de usuarios alineado con el botón -->
            <div class="boton" style="margin-top: 40px;">
                <form action="Perfil.jsp" method="GET" class="form-inline">
                    <div class="input-group">
                        <input type="text" name="searchTerm" class="form-control" placeholder="Buscar usuario" value="<%= searchTerm %>">
                        <span class="input-group-btn">
                            <button class="btn btn-primary" type="submit">Buscar</button>
                        </span>
                    </div>
                </form>
            </div>

            <table class="table table-bordered" id="tablaDatos">
                <thead>
                    <tr>
                        <th class="text-center" width="120">ID</th>
                        <th class="text-center" width="200">Nombre</th>
                        <th class="text-center" width="200">Teléfono</th>
                        <th class="text-center" width="200">Usuario</th>
                        <th class="text-center" width="200">Contrasena</th> <!-- Agregar esta línea -->
                        <th class="text-center" width="200">Cargo</th>
                        <th class="text-center" width="200">Acciones</th>
                    </tr>                    
                </thead>
                <tbody id="tbodys">
                    <% while(ListaPerfiles.next()) { %>
                        <tr>
                            <td class="text-center"><%= ListaPerfiles.getInt("ID") %></td>
                            <td><%= ListaPerfiles.getString("nombre") %></td>
                            <td><%= ListaPerfiles.getString("telefono") %></td>
                            <td><%= ListaPerfiles.getString("usuario") %></td>
                            <td><%= ListaPerfiles.getString("contrasena") %></td> <!-- Agregar esta línea -->
                            <td><%= ListaPerfiles.getString("cargo") %></td>
                            <td class="text-center">
                                <a class="btn btn-primary" onclick="editarPerfil(<%= ListaPerfiles.getInt("ID")%>)">Editar</a>
                                <a class="btn btn-danger" onclick="eliminarPerfil(<%= ListaPerfiles.getInt("ID")%>)">Eliminar</a>
                            </td>
                        </tr>
                    <% } %>
                </tbody>                
            </table>
        </div>
    </div>
</body>
</html>
