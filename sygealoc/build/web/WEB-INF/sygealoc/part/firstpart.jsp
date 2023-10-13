<%-- 
    Document   : firstpart
    Created on : Aug 29, 2020, 3:35:22 PM
    Author     : monhel.pierre
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="supernova.pfe.tool.Db_access"%>
<%@page import="supernova.pfe.tool.MyDate"%>
<%@page import="supernova.pfe.model.UserPermission"%>
<%@page import="supernova.pfe.model.UserPermission"%>
<%@page import="supernova.pfe.model.UserPermission"%>
<%@page import="supernova.pfe.model.UserPermission"%>
<%@page import="java.util.ArrayList"%>
<%@page import="supernova.pfe.model.Employe"%>
<%@page import="supernova.pfe.model.Localization"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="supernova.pfe.tool.MySession"%>
<%@page import="supernova.pfe.tool.Db_access"%>

<%    
    if (request.getSession().getAttribute("company") == null) {
        response.sendRedirect("erreur");
    }
    
    MySession.path = (request.getServletContext().getRealPath("/").replace("\\", "/").replace("build/", ""))+"assets";
    new MySession(request);
    
    int total_pages = Integer.parseInt(request.getAttribute("total_pages") != null ? request.getAttribute("total_pages").toString() : "1");
    int nbbypage = Integer.parseInt(request.getAttribute("nbbypage") != null ? request.getAttribute("nbbypage").toString() : "0");;
    int active_page = Integer.parseInt(request.getAttribute("active_page") != null ? request.getAttribute("active_page").toString() : "0");
    Employe m = null;
    ArrayList<UserPermission> r = null;
    if (request.getSession() == null || request.getSession().getAttribute("member_info") == null) {
        response.sendRedirect("connexion");
    } else {
        m = ((Employe) request.getSession().getAttribute("member_info"));
        r = ((ArrayList<UserPermission>) request.getSession().getAttribute("rights"));
        
        if (request.getAttribute("position") != null) {
            if(!request.getAttribute("position").equals("impression")){ 
                MySession.setPosition(m.PSEUDO(), request.getAttribute("position").toString());   
            }
        }
%>

<!DOCTYPE html>
<html class="loading" lang="en" data-textdirection="ltr">
    <head>
        <meta http-equiv="Content-Type" content="text/html" charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0, minimal-ui">
        <meta name="description" content="Systeme de gestion de location de voiture">
        <meta name="keywords" content="avis, rental, car, haiti, supernova, chcl, pfe, ueh">
        <meta name="author" content="SUPERNOVA">
        <title>${active_menu==null?'TABLEAU DE BORD':active_menu.toUpperCase()} ${company!=null?'-':''} ${company.getCOMPANYNAME()}</title>
        <link rel="apple-touch-icon" href="${pageContext.request.contextPath}/assets/images/ico/apple-icon-120.png">
        <link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath}/${theme.getLOGO()}">

        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/bootstrap.min.css">
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/bootstrap-extended.min.css">
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/colors.min.css">
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/components.min.css">
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/core/menu/menu-types/vertical-menu-modern.css">
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/core/colors/palette-gradient.min.css">
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/vendors/css/charts/jquery-jvectormap-2.0.3.css">
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/vendors/css/charts/morris.css">
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/plugins/extensions/toastr.min.css">
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/vendors/css/extensions/toastr.css">
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/core/colors/palette-gradient.min.css">
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/fonts/fonts.css">
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/fonts/line-awesome/css/line-awesome.min.css">
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/fonts/feather/style.min.css">
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/fonts/simple-line-icons/css/simple-line-icons.min.css">
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/fonts/meteocons/style.min.css">
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/fonts/font-awesome/css/font-awesome.min.css">
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/fonts/material-design-icons/material-icon.css">
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/bootstrap.min.css">
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/bootstrap-extended.min.css">
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/colors.min.css">
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/components.min.css">
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/vendors/css/vendors.min.css">
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/vendors/css/pickers/daterange/daterangepicker.css">
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/vendors/css/pickers/pickadate/pickadate.css">
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/core/menu/menu-types/vertical-menu-modern.css">
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/core/colors/palette-gradient.min.css">
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/plugins/pickers/daterange/daterange.min.css">
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/vendors/css/extensions/toastr.css">
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/datatable.css">
    </head>

    <body class="vertical-layout vertical-menu-modern 2-columns fixed-navbar" data-open="click" data-menu="vertical-menu-modern" data-col="2-columns">
        <nav class="header-navbar navbar-expand-lg navbar navbar-with-menu navbar-without-dd-arrow fixed-top navbar-semi-dark navbar-shadow">
            <div class="navbar-wrapper">
                <div class="navbar-header">
                    <ul class="nav navbar-nav flex-row">
                        <li class="nav-item mobile-menu d-lg-none mr-auto"><a class="nav-link nav-menu-main menu-toggle hidden-xs" href="#"><i class="ft-menu font-large-1"></i></a></li>
                        <li class="nav-item mr-auto"><a class="navbar-brand" href="tableaudebord"><img class="brand-logo" alt="sygealoc logo" src="${pageContext.request.contextPath}/${theme.getLOGO()}">
                                <h3 class="brand-text">${company.getCOMPANYNAME()}</h3></a></li>
                        <li class="nav-item d-none d-lg-block nav-toggle"><a class="nav-link modern-nav-toggle pr-0" data-toggle="collapse"><i class="toggle-icon ft-toggle-right font-medium-3 white" data-ticon="ft-toggle-right"></i></a></li>
                        <li class="nav-item d-lg-none"><a class="nav-link open-navbar-container" data-toggle="collapse" data-target="#navbar-mobile"><i class="la la-ellipsis-v"></i></a></li>
                    </ul>
                </div>
                <div class="navbar-container content">
                    <div class="collapse navbar-collapse" id="navbar-mobile">
                        <ul class="nav navbar-nav mr-auto float-left">
                            <li class="nav-item d-none d-lg-block text-bold-500" >
                                AVIS RENT A CAR
                            </li>
                        </ul>
                        <ul class="nav navbar-nav float-right">
                            <li class="dropdown dropdown-user nav-item"><a class="dropdown-toggle nav-link dropdown-user-link" href="#" data-toggle="dropdown"><span class="mr-1 user-name text-bold-700"><%=m.PSEUDO()%></span><span class="avatar avatar-online"><img height="20px" src="${pageContext.request.contextPath}/assets/uploads/utilisateur/admin920313mon.jpg" alt="avatar"><i></i></span></a>
                                <div class="dropdown-menu dropdown-menu-right">
                                    <a class="dropdown-item" id="prof_link" href="profile"><i class="ft-user"></i> Profile</a>
                                    <div class="dropdown-divider"></div><a class="dropdown-item" href="#" onclick="holdModal('confirmdisconnection')"><i class="ft-power"></i> D&eacute;connexion</a>
                                </div>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
        </nav>

        <div class="main-menu menu-fixed menu-dark menu-accordion menu-shadow" data-scroll-to-active="true">
            <div class="main-menu-content">
                <ul class="navigation navigation-main" id="main-menu-navigation" data-menu="menu-navigation">
                    <li class=" navigation-header"><span data-i18n="Admin Panels">Acceuil</span><i class="la la-ellipsis-h" data-toggle="tooltip" data-placement="right" data-original-title="Admin Panels"></i>
                    <li class="nav-item" id="tableaudebord"><a href="tableaudebord"><i class="la la-home"></i><span class="menu-title" data-i18n="Dashboard">Tableau de bord</span></a>
                    </li>
                    <%if ((r != null) && r.size() > 0 && ((r.get(0).getCAN_VIEW().equals("1")) || (r.get(1).getCAN_VIEW().equals("1"))
                                || (r.get(2).getCAN_VIEW().equals("1")) || (r.get(3).getCAN_VIEW().equals("1"))
                                || (r.get(4).getCAN_VIEW().equals("1")) || (r.get(5).getCAN_VIEW().equals("1")))) {%>
                    <li class=" navigation-header"><span data-i18n="Admin Panels">Gestion</span><i class="la la-ellipsis-h" data-toggle="tooltip" data-placement="right" data-original-title="Admin Panels"></i>
                    </li>
                    <%}%>

                    <%if (r != null && r.size() > 0 && r.get(0).getCAN_VIEW().equals("1")) {%>
                    <li class=" nav-item" id="employe"><a href="employe"><i class="la la-user"></i><span class="menu-title" data-i18n="employe">Employ&eacute;</span></a>
                    </li>
                    <%}%>

                    <%if (r != null && r.size() > 0  && r.get(1).getCAN_VIEW().equals("1")) {%>
                    <li class=" nav-item" id="client"><a href="client"><i class="las la-clone"></i><span class="menu-title" data-i18n="client">Client</span></a>
                    </li>
                    <%}%>

                    <%if (r != null && r.size() > 0  && r.get(2).getCAN_VIEW().equals("1")) {%>
                    <li class=" nav-item" id="fournisseur"><a href="fournisseur"><i class="las la-industry"></i><span class="menu-title" data-i18n="fournisseur">Fournisseur</span></a>
                    </li>
                    <%}%>

                    <%if (r != null && r.size() > 0  && r.get(3).getCAN_VIEW().equals("1")) {%>
                    <li class=" nav-item" id="stock"><a href="stock"><i class="la la-automobile"></i><span class="menu-title" data-i18n="stock">Stock</span></a>
                    </li>
                    <%}%>

                    <%if (r != null && r.size() > 0  && r.get(4).getCAN_VIEW().equals("1")) {%>
                    <li class=" nav-item" id="reservation"><a href="reservation"><i class="las la-money-bill-wave-alt"></i></i><span class="menu-title" data-i18n="reservation">R&eacute;servation</span></a>
                    </li>
                    <%}%>

                    <%if (r != null && r.size() > 0  && r.get(5).getCAN_VIEW().equals("1")) {%>
                    <li class=" nav-item" id="location"><a href="location"><i class="las la-hand-holding-usd"></i><span class="menu-title" data-i18n="location">Location</span></a>
                    </li>
                    <%}%>

                    <%if (r != null && r.size() > 0  && r.get(6).getCAN_VIEW().equals("1")) {%>
                    <li class=" navigation-header"><span data-i18n="Securite">Securite</span><i class="la la-ellipsis-h" data-toggle="tooltip" data-placement="right" data-original-title="Admin Panels"></i>
                    </li>
                    <li class=" nav-item" id="utilisateur"><a href="utilisateur"><i class="la la-users"></i><span class="menu-title" data-i18n="utilisateur">Utilisateur</span></a>
                    </li>
                    <%}%>
                </ul>
            </div>
        </div>

        <div class="app-content content">
            <div class="content-overlay"></div>
            <div class="content-wrapper">
                <div class="content-header row">
                    <div class="content-header-left col-md-6 col-12 mb-2 breadcrumb-new">
                        <h3 class="content-header-title mb-0 d-inline-block" id="currentpage">${active_menu==null?"TABLEAU DE BORD":active_menu.toUpperCase()}</h3>
                        <div class="row breadcrumbs-top d-inline-block">
                            <div class="breadcrumb-wrapper col-12">
                                <ol class="breadcrumb">
                                    <li class="breadcrumb-item"><a href="tableaudebord">${company.getCOMPANYNAME().toLowerCase()}</a>
                                    </li>
                                    <li class="breadcrumb-item"><a href="#">${active_menu==null?"acceuil":(active_menu=="utilisateur" || active_menu=="parametre"?"securite":"gestion")}</a>
                                    </li>
                                    <li class="breadcrumb-item active">${active_menu==null?"Tableau de bord":active_menu}
                                    </li>
                                </ol>
                            </div>
                        </div>
                    </div>
                </div>
                <%}%>