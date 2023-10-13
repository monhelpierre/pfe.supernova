<%-- 
    Document   : login
    Created on : Aug 29, 2020, 3:41:57 PM
    Author     : monhel.pierre
--%>
<%@page import="supernova.pfe.tool.MySession"%>
<%@page import="java.net.NetworkInterface"%>
<%@page import="java.net.InetAddress"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    MySession.path = (request.getServletContext().getRealPath("/").replace("\\", "/").replace("build/", "")) + "assets";
    new MySession(request);
    if (MySession.getModuleFor(MySession.mac) != null && request.getSession().getAttribute("member_info") == null) {
        response.sendRedirect("verouiller");
    }
    
    if (request.getSession().getAttribute("company") == null) {
        response.sendRedirect("erreur");
    }
%>

<html class="loading" lang="en" data-textdirection="ltr">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0, minimal-ui">
        <meta name="description" content="Systeme de gestion de location de voiture">
        <meta name="keywords" content="avis, rental, car, haiti, supernova, chcl, pfe, ueh">
        <meta name="author" content="SUPERNOVA">
        <title>${active_menu==null?'DASHBOARD':active_menu.toUpperCase()} - ${company.getCOMPANYNAME()}</title>

        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/bootstrap.min.css">
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/bootstrap-extended.min.css">
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/components.min.css">
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/vendors/css/extensions/toastr.css">
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/fonts/line-awesome/css/line-awesome.min.css">
        <link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath}/${theme.getLOGO()}">
    </head>

    <body style="background-color: white" class="vertical-layout vertical-menu-modern 1-column blank-page" data-menu="vertical-menu-modern" data-col="1-column">
        <div class="app-content content">
            <div class="content-overlay"></div>
            <div class="content-wrapper">
                <div class="content-header row">
                </div>
                <div class="content-body">
                    <section class="row flexbox-container">
                        <div class="col-12 d-flex align-items-center justify-content-center card-img-top img-fluid bg-cover height-300 huser-profile-cover-image" style="background-image: url('${pageContext.request.contextPath}/assets/uploads/car/19.jpg')">
                            <div class="col-lg-4 col-md-8 col-10 box-shadow-2 p-0">
                                <div class="card border-grey border-lighten-3 m-0">
                                    <div class="card-header border-0">
                                        <div class="card-title text-center">
                                            <div class="p-1"><img src="${pageContext.request.contextPath}/${theme.getLOGO()}" alt="branding logo"></div>
                                        </div>
                                        <h5 class="card-subtitle line-on-side text-muted text-center font-small-8 pt-3 text-bold-800"><span>CONNEXION &Agrave; ${company.getCOMPANYNAME().toUpperCase()}</span>
                                        </h5>
                                    </div>
                                    <div class="card-content">
                                        <div class="card-body">
                                            <form class="form-horizontal form-simple" action="connexion" method="post">
                                                <fieldset class="form-group position-relative has-icon-left mb-0">
                                                    <input type="text" class="form-control" name="pseudo" value="${pseudo}" placeholder="Pseudo">
                                                    <div class="form-control-position">
                                                        <i class="la la-user"></i>
                                                    </div>
                                                </fieldset>

                                                <fieldset class="form-group position-relative has-icon-left">
                                                    <input type="password" class="form-control" name="password" value="${password}" placeholder="Mot de passe">
                                                    <div class="form-control-position">
                                                        <i class="la la-key"></i>
                                                    </div>
                                                </fieldset>
                                                <button name="action" type="submit" class="btn btn-info btn-block"><i class="ft-unlock"></i> Connecter</button>
                                            </form>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </section>

                </div>
            </div>
        </div>
        <%@include file="part/lastpart.jsp" %>
    </body>
</html>

<script>
    if ("${msg}".length > 0) {
        toastr.error("${msg}", "${company.getCOMPANYNAME().toUpperCase()} - ${active_menu.toUpperCase()} ");
    }
</script>