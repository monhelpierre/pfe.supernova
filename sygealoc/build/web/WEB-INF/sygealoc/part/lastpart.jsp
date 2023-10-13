<%-- 
    Document   : lastpart
    Created on : Aug 29, 2020, 3:35:37 PM
    Author     : monhel.pierre
--%>

</div>
<div class="sidenav-overlay"></div>
<div class="drag-target"></div>

<footer id="footerview" class="footer footer-static footer-light navbar-border navbar-shadow">
    <p class="clearfix blue-grey lighten-2 text-sm-center mb-0 px-2">
        <span class="float-md-left d-block d-md-inline-block">
            Copyright &copy; 2021 ${company.getCOMPANYNAME()}
        </span>
        <span class="float-md-right d-none d-lg-block">
            chcuehl.pfe.supernova
            <span id="scroll-top"></span>
        </span>
    </p>
</footer>

<div class="modal fade" id="confirmdisconnection" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel1"
     aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <section class="contact-form">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel1">Deconnexion</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <span id="del_id" style="display: none"></span>
                    <p>Etes vous sur de vouloir vous deconnecter ?</p>
                </div>
                <div class="modal-footer">
                    <fieldset class="form-group position-relative has-icon-left mb-0">
                        <button onclick="disconnect()" type="button" class="btn btn-info add-contact-item"><i
                                class="la la-paper-plane-o d-block d-lg-none"></i> <span class="d-none d-lg-block">Oui</span></button>
                    </fieldset>
                </div>
            </section>
        </div>
    </div>
</div>

<script src="${pageContext.request.contextPath}/assets/vendors/js/vendors.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/core/app-menu.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/core/app.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/scripts/customizer.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/scripts/footer.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/mask.js"></script>
<script src="${pageContext.request.contextPath}/assets/datatable.js"></script>

<script>
                            function numberMask(inputid, limit) {
                                return IMask(
                                        document.getElementById(inputid),
                                        {
                                            mask: '$ num',
                                            blocks: {
                                                num: {
                                                    mask: Number,
                                                    thousandsSeparator: ' ',
                                                    min: 1,
                                                    max: limit
                                                }
                                            }
                                        }
                                );
                            }

                            function readable(nbr){
                                var nombre = '' + nbr;
                                var retour = '';
                                var count = 0;
                                for (var i = nombre.length - 1; i >= 0; i--)
                                {
                                    if (count != 0 && count % 3 == 0)
                                        retour = nombre[i] + ' ' + retour;
                                    else
                                        retour = nombre[i] + retour;
                                    count++;
                                }
                                return retour;
                            }

                            function disconnect() {
                                window.location.href = "deconnexion";
                            }

                            if ("${active_menu}" != null && "${active_menu}".length > 0) {
                                $("#tableaudebord").attr("class", $("#tableaudebord").attr("class").replace(" active", ""));
                                $("#${active_menu}").attr("class", $("#${active_menu}").attr("class") + " active");
                            } else {
                                $("#tableaudebord").attr("class", $("#tableaudebord").attr("class") + " active");
                                $("#${active_menu}").attr("class", $("#${active_menu}").attr("class").replace(" active", ""));
                            }

                            function resetData() {
                                $("#add_form")[0].reset();
                                $("#edit_form")[0].reset();
                            }

                            function holdModal(id) {
                                $("#" + id).modal({
                                    keyboard: false,
                                    backdrop: 'static'
                                }).show();
                            }

                            function removeSession(parameter) {
                                $.ajax({
                                    url: '${pageContext.request.contextPath}/assets/services/removeSession.jsp',
                                    type: "POST",
                                    data: {parameter: parameter},
                                    dataType: 'json',
                                    success: function (data) {
                                    },
                                    error: function (data) {
                                        toastr.error(data.message, "${company.getCOMPANYNAME().toUpperCase()} - ${active_menu.toUpperCase()} ");
                                    }
                                });
                            }

</script>
<script src="${pageContext.request.contextPath}/assets/vendors/js/extensions/toastr.min.js"></script>
</body>
</html>