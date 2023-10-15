<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="basededatos.*" %>
<%@page import="java.sql.*" %>

<% 
   Conexion c = new Conexion(); //creamos la conexion a la base de datos
   //ejecutamos la consulta
ResultSet ListaAccesorios = c.smt.executeQuery("SELECT IDAccesorio, Nombre, Descripcion, CantidadInventario, Precio FROM accesorios");
   

   String searchTerm = request.getParameter("searchTerm"); // Obtiene el término de búsqueda
   if (searchTerm == null) {
       searchTerm = ""; // Establece el término de búsqueda en una cadena vacía si es nulo
   }
   

%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Accesorios</title>
        <script src="Script/Slidebar.js" defer ></script>
        <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <link href="estilosCSS/Slidebar.css" rel="stylesheet">
        <link href='https://unpkg.com/boxicons@2.0.9/css/boxicons.min.css' rel='stylesheet'>
        <link href="estilosCSS/Contenedor.css" rel="stylesheet">
        <link href="estilosCSS/Enlaces.css" rel="stylesheet">
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
                <h1>ACCESORIOS</h1>

                <!-- Botón para agregar accesorio -->
                <div class="boton">
                    <button type="button" class="btn btn-success btn-lg" data-toggle="modal" data-target="#agregarAccesorioModal">AGREGAR ACCESORIO</button>
                </div>

                <!-- Formulario de búsqueda de accesorios -->
                <div class="boton">
                    <form action="tu_pagina.jsp" method="GET" class="form-inline">
                        <div class="input-group">
                            <input type="text" name="searchTerm" class="form-control" placeholder="Buscar accesorio" value="<%= searchTerm%>">
                            <span class="input-group-btn">
                                <button class="btn btn-primary" type="submit">Buscar</button>
                            </span>
                        </div>
                    </form>
                </div>

                <!-- Tabla de accesorios con imágenes -->
                <table class="table table-bordered" id="tablaDatos">
                    <thead>
                        <tr>
                            <th class="text-center" width="120">ID</th>
                            <th class="text-center" width="200">Nombre</th>
                            <th class="text-center" width="200">Descripción</th>
                            <th class="text-center" width="200">Cantidad en Inventario</th>
                            <th class="text-center" width="200">Precio</th>
                            <th class="text-center" width="200">Acciones</th>
                        </tr>
                    </thead>
                    <tbody id="tbodys">
                        <% while (ListaAccesorios.next()) {%>
                        <tr>
                            <td class="text-center"><%= ListaAccesorios.getInt("IDAccesorio")%></td>
                            <td><%= ListaAccesorios.getString("Nombre")%></td>
                            <td><%= ListaAccesorios.getString("Descripcion")%></td>
                            <td class="text-center"><%= ListaAccesorios.getInt("CantidadInventario")%></td>
                            <td class="text-center"><%= ListaAccesorios.getDouble("Precio")%></td>
                            <td class="text-center">
                                <table>
                                    <tr>
                                        <td style="padding-right: 10px;"><a class="btn btn-success">Editar</a></td>
                                        <td style="padding-right: 10px;"><a class="btn btn-danger">Eliminar</a></td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <% }%>
                    </tbody>
                </table>

                <!-- Botones de exportar a PDF y Excel -->
                <div class="boton">
                    <button class="btn btn-info">Exportar a PDF</button>
                    <button class="btn btn-success">Exportar a Excel</button>
                </div>
            </div>
        </div>
    </body>
</html>
