<%-- 
    Document   : Calendario
    Created on : 9 set. 2023, 22:42:27
    Author     : vieri
--%>
<%@page import="Modelo.Citas"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.CitaDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="basededatos.*" %>
<%@page import="java.sql.*" %>
<%
    CitaDAO citaDao = new CitaDAO();
    java.util.Calendar calendar = java.util.Calendar.getInstance();
    String[] monthNames = new String[]{
        "Enero", "Febrero", "Marzo", "Abril", "Mayo", "Junio", "Julio", "Agosto",
        "Septiembre", "Octubre", "Noviembre", "Diciembre"
    };
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Calendario</title>
        <script src="Script/Slidebar.js" defer ></script>
        <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <link href="estilosCSS/Slidebar.css" rel="stylesheet">
        <link href='https://unpkg.com/boxicons@2.0.9/css/boxicons.min.css' rel='stylesheet'>
        <link href="estilosCSS/Contenedor.css" rel="stylesheet">
        <link href="estilosCSS/Enlaces.css" rel="stylesheet">
        <link href="estilosCSS/Calendario.css" rel="stylesheet">
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
            <div class="wrap-calendar">

                <%                // Obtiene la fecha actual
                    String selectedMonth = request.getParameter("month");
                    String selectedYear = request.getParameter("year");
                    int year = calendar.get(java.util.Calendar.YEAR);
                    int month = calendar.get(java.util.Calendar.MONTH);
                    if (selectedMonth != null && selectedYear != null) {
                        year = Integer.valueOf(selectedYear);
                        month = Integer.valueOf(selectedMonth);
                    }

                    int dayOfMonth = calendar.get(java.util.Calendar.DAY_OF_MONTH);
                    // Configura el primer día del mes
                    calendar.set(year, month, 1);
                    int firstDayOfWeek = calendar.get(java.util.Calendar.DAY_OF_WEEK);
                    String monthName = monthNames[month];

                    // Calcula el número de días en el mes
                    int daysInMonth = calendar.getActualMaximum(java.util.Calendar.DAY_OF_MONTH);
                %>

                <div class="container ">
                    <div class="row vertical-center ">
                        <div class="col-sm-6">
                            <h1>CALENDARIO</h1>
                        </div>
                        <div class="col-sm-6">
                            <form method="post" action="">
                                <div  class="row" >
                                    <div class="col-sm-4">
                                        <select name="month" id="month" class="form-control">
                                            <% for (int i = 0; i < monthNames.length; i++) {%>
                                            <option value=<%= i%> <%= (month == i) ? "selected" : ""%>><%= monthNames[i]%></option>
                                            <% } %>
                                            <!-- Agrega opciones para todos los meses -->
                                        </select>
                                    </div>
                                    <div class="col-sm-4">
                                        <select name="year" id="year" class="form-control">
                                            <% for (int i = 2021; i < 2025; i++) {%>
                                            <option value=<%= i%> <%= (year == i) ? "selected" : ""%>><%= i%></option>
                                            <% } %>
                                        </select>
                                    </div>
                                    <div class="col-sm-4">
                                        <button type="submit" class="btn btn-primary">Filtrar</button>
                                    </div>
                                </div>
                            </form>
                        </div>

                    </div>
                    <div class="row">
                        <table class="table calendar">
                            <tr>
                                <th  scope="col">Domingo</th>
                                <th  scope="col">Lunes</th>
                                <th  scope="col">Martes</th>
                                <th scope="col">Miércoles</th>
                                <th  scope="col">Jueves</th>
                                <th  scope="col">Viernes</th>
                                <th  scope="col">Sábado</th>
                            </tr>
                            <tr>
                                <% // Rel
                                    for (int i = 1; i < firstDayOfWeek; i++) { %>
                                <td></td>
                                <% } %>
                                <% // Itera a través de los días del mes
                                    ;
                                    for (int day = 1; day <= daysInMonth; day++) {%>
                                <td class="day <%= (dayOfMonth == day) ? "currentDay" : ""%>">
                                    <%System.out.println(month+"-"+calendar.get(java.util.Calendar.MONTH));%>
                                    <% ArrayList<Citas> citas = citaDao.obtenerCitasPorFecha(new Date(year - 1900, month, day));%>
                                    <%= day%>
                                    <% for (Citas cita : citas) {%>
                                     
                                    <div class="btn-outline-custom">
                                        <%= cita.getMascota().getCliente().getNombre() + ": " + cita.getRazonCita()%>
                                    </div>
                                    <% } %>
                                </td>
                                <% // Agrega una nueva fila al final de cada semana
                                    if ((day + firstDayOfWeek - 1) % 7 == 0) { %>
                            </tr>
                            <tr>
                                <% } %>
                                <% }%>
                            </tr>
                        </table>


                    </div>
                </div>

            </div>
        </div>
    </body>
</html>

