<%-- 
    Document   : erreur
    Created on : Oct 15, 2020, 3:36:32 PM
    Author     : monhel.pierre
--%>

<%@page import="supernova.pfe.tool.Db_access"%>
<%
    Db_access.connect();
    if (Db_access.con != null) {
        response.sendRedirect("login");
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
        <title>SYGEALOC - ERREUR</title>
        <link rel="apple-touch-icon" href="${pageContext.request.contextPath}/assets/images/ico/apple-icon-120.png">

        <link href="${pageContext.request.contextPath}/assets/fonts/fonts.css" rel="stylesheet">
        <!-- Icons -->
        <!-- Line awesome icons -->
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/fonts/line-awesome/css/line-awesome.min.css">

        <!-- Feather icons -->
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/fonts/feather/style.min.css">

        <!-- Simple line icons -->
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/fonts/simple-line-icons/css/simple-line-icons.min.css">

        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/fonts/meteocons/style.min.css">

        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/fonts/font-awesome/css/font-awesome.min.css">

        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/fonts/material-design-icons/material-icon.css">

        <!-- BEGIN: Vendor CSS-->
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/vendors/css/vendors.min.css">
        <!-- END: Vendor CSS-->

        <!-- BEGIN: Theme CSS-->
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/bootstrap.min.css">
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/bootstrap-extended.min.css">
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/colors.min.css">
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/components.min.css">
        <!-- END: Theme CSS-->

        <!-- BEGIN: Page CSS-->
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/core/menu/menu-types/vertical-menu-modern.css">
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/core/colors/palette-gradient.min.css">
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/pages/error.min.css">
        <!-- END: Page CSS-->

    </head>
    <!-- END: Head-->

    <!-- BEGIN: Body-->
    <body class="vertical-layout vertical-menu-modern 1-column   blank-page" data-open="click" data-menu="vertical-menu-modern" data-col="1-column">
        <!-- BEGIN: Content-->
        <div class="app-content content">
            <div class="content-overlay"></div>
            <div class="content-wrapper">
                <div class="content-header row">
                </div>
                <div class="content-body"><section class="flexbox-container">
                        <div class="col-12 d-flex align-items-center justify-content-center">
                            <div class="col-lg-4 col-md-8 col-10 p-0">
                                <div class="card-header bg-transparent border-0">
                                    <h2 class="error-code text-center mb-2">503</h2>
                                    <h3 class="text-uppercase text-center">Impossible de se connecter &agrave; la base de donn&eacute;es</h3>
                                </div>
                                <div class="card-content">
                                    
                                    <div class="row py-2">
                                        <div class="col-12 col-sm-6 col-md-6 mb-1">
                                            <a href="erreur" class="btn btn-primary btn-block"><i class="ft-home"></i> Rafraichir</a>
                                        </div>
                                        <div class="col-12 col-sm-6 col-md-6 mb-1">
                                            <a href="#" class="btn btn-danger btn-block"><i class="ft-search"></i>  Rechercher</a>
                                        </div>
                                    </div>
                                </div>
                                <div class="card-footer bg-transparent">
                                    <div class="row">
                                        <p class="text-muted text-center col-12 pb-1">© <span class="year"></span> <a href="#">SYGEALOC by SUPERNOVA </a></p>  
                                    </div>
                                </div>
                            </div>
                        </div>
                    </section>

                </div>
            </div>
        </div>
        
        <script src="${pageContext.request.contextPath}/assets/vendors/js/vendors.min.js"></script>
        <script src="${pageContext.request.contextPath}/assets/vendors/js/forms/validation/jqBootstrapValidation.js"></script>
        <script src="${pageContext.request.contextPath}/assets/js/core/app-menu.min.js"></script>
        <script src="${pageContext.request.contextPath}/assets/js/core/app.min.js"></script>
        <script src="${pageContext.request.contextPath}/assets/js/scripts/forms/form-login-register.min.js"></script>
    </body>
</html>