<%-- 
    Document   : profile
    Created on : Aug 30, 2020, 7:05:25 PM
    Author     : GIRLS
--%>

<%@page isELIgnored="false" %>
<%@page import="supernova.pfe.model.Employe"%>
<%@include file="part/firstpart.jsp" %>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/vendors/css/vendors.min.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/vendors/css/forms/icheck/icheck.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/vendors/css/forms/icheck/custom.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/vendors/js/gallery/photo-swipe/photoswipe.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/vendors/js/gallery/photo-swipe/default-skin/default-skin.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/vendors/css/charts/leaflet.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/pages/users.min.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/pages/timeline.min.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/vendors/css/extensions/toastr.css">

<div class="content-body"><div id="user-profile">
        <div class="row">
            <div class="col-12">
                <div class="card profile-with-cover">
                    <div class="card-img-top img-fluid bg-cover height-300 huser-profile-cover-image" style="background-image: url('${pageContext.request.contextPath}/assets/uploads/car/31.jpg')"></div>
                    <div class="media profil-cover-details w-100">
                        <div class="media-left pl-2 pt-2">
                            <a href="#" class="profile-image">
                                <img height="45" width="65" id="profile" src="${pageContext.request.contextPath}/assets/uploads/utilisateur/admin920313mon.jpg" class="rounded-circle img-border height-100" alt="Profile">
                            </a>
                        </div>
                        <div class="media-body pt-3 px-2">
                            <form id="profile_form" method="post" enctype="multipart/form-data" action="profile">
                                <div class="row">
                                    <div class="col">
                                        <h3 class="card-title text-bold-500" style="font-weight: bold"><%=(m != null) ? (m.PSEUDO().equals("admin") ? m.PSEUDO() : m.NOMCOMPLET()) : ""%> (<%=(m != null) ? m.POSTE() : ""%>)</h3>
                                    </div>
                                    <input name="profile" type="file" id="upload" hidden onchange="$('#profile_form').submit()">
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div> 

<form id="add_form" class="contact-input" method="post" autocomplete="off">
    <input type="hidden" name="personnel" id="personnel" value="<%=m != null ? m.ID() : ""%>" />
    <input type="hidden" name="id" id="prof_id" value="<%=m != null ? m.ID() : ""%>" />

    <fieldset class="form-group col-12">
        <input <%=m != null ? (m.PSEUDO().equals("admin") ? "hidden" : "") : ""%> type="text" name="pseudo" id="pseudo" class="contact-name form-control" placeholder="Pseudo" value="<%=m != null ? m.PSEUDO() : ""%>">
    </fieldset>
    
    <fieldset class="form-group col-12">
        <input type="password" name="motdepasse" id="currentpassword" class="contact-email form-control" placeholder="Mot de passe actuel" value="">
    </fieldset>
    
    <fieldset class="form-group col-12">
        <input type="password" name="newmotdepasse" id="newpassword" class="contact-email form-control" placeholder="Nouveau mot de passe" value="">
    </fieldset>
    
    <fieldset class="form-group col-12">
        <input type="password" name="confirmermotdepasse" id="confirm" class="contact-phone form-control" placeholder="Confirmer" value="">
    </fieldset>
    
    <fieldset class="form-group col-12 position-relative has-icon-left mb-0">
        <button onclick="updateProfile()" type="button" class="btn btn-info add-contact-item"><i
                class="la la-paper-plane-o d-block d-lg-none"></i> <span class="d-none d-lg-block">Modifier</span></button>
    </fieldset>
    <br/>
</form>

</div>

<%@include file="part/lastpart.jsp" %>
<script src="${pageContext.request.contextPath}/assets/vendors/js/extensions/toastr.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/scripts/extensions/toastr.min.js"></script>

<script>
            function updateProfile() {
                var MEM = $("#prof_id").val();
                var ID = $("#personnel").val();
                var PSEUDO = $("#pseudo").val();
                var MOTDEPASSE = $("#currentpassword").val();
                var NEWPASSWORD = $("#newpassword").val();
                var CONFIRMER = $("#confirm").val();
                $.ajax({
                    url: '${pageContext.request.contextPath}/assets/services/utilisateur/updateProfile.jsp',
                    type: "POST",
                    data: {ID: MEM, personnel: ID, pseudo: PSEUDO, motdepasse: MOTDEPASSE, newmotdepasse: NEWPASSWORD, confirmermotdepasse: CONFIRMER},
                    dataType: 'json',
                    success: function (res) {
                        if(res.link != 'null'){window.location.href = res.link;} 
                        if (!res.message.includes("succes")) {
                            toastr.error(res.message, "${company.getCOMPANYNAME().toUpperCase()} - ${active_menu.toUpperCase()} ");
                        } else {
                            setTimeout(toastr.success(res.message, "${company.getCOMPANYNAME().toUpperCase()} - ${active_menu.toUpperCase()} "), 5000);
                            window.location.reload(true);
                        }
                    },
                    error: function () {
                        toastr.error("Erreur", "${company.getCOMPANYNAME().toUpperCase()} - ${active_menu.toUpperCase()} ");
                    }
                });
            }

            if ("${msg}".length > 0) {
                if (!"${msg}".includes("succes")) {
                    toastr.error("${msg}", "${company.getCOMPANYNAME().toUpperCase()} - ${active_menu.toUpperCase()} ");
                } else {
                    setTimeout(toastr.success("${msg}", "${company.getCOMPANYNAME().toUpperCase()} - ${active_menu.toUpperCase()} "), 5000);
                    $("#prof_link").click();
                }
            }

            if ("<%=request.getSession().getAttribute("welcome")%>" != "null") {
                toastr.info("<%=request.getSession().getAttribute("welcome")%>", "${company.getCOMPANYNAME().toUpperCase()} - TABLEAU DE BORD");
                removeSession("welcome");
            }
</script>