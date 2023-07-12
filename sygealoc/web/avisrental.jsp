<%@page import="supernova.pfe.tool.MySession"%>
<%@page import="supernova.pfe.tool.Db_access"%>
<%
    String hostname = "localhost";
    int port = 3306;
    String db = "pfe.supernova";
    String username = "root";
    String password = "";
    new MySession(request);
    if (Db_access.isNotYetConfigured()) {
        Db_access.setCredentials(hostname, port, db, username, password);
        Db_access.connect();
        if (Db_access.con != null) {
            if (request.getSession().getAttribute("member_info") == null) {
                request.getRequestDispatcher("connexion").forward(request, response);
            } else {
                response.sendRedirect("tableaudebord");
            }
        } else {
            response.sendRedirect("erreur");
        }
    } else {
        if (Db_access.con == null) {
            Db_access.connect();
            response.sendRedirect("erreur");
        } else {
            if (Db_access.con != null) {
                if (request.getSession().getAttribute("member_info") == null) {
                    request.getRequestDispatcher("connexion").forward(request, response);
                } else {
                    response.sendRedirect("tableaudebord");
                }
            } else {
                response.sendRedirect("erreur");
            }
        }
    }
%>