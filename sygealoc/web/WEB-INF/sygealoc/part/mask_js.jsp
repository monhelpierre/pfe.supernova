<script src="${pageContext.request.contextPath}/assets/vendors/js/forms/extended/inputmask/jquery.inputmask.bundle.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/vendors/js/forms/extended/typeahead/typeahead.bundle.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/vendors/js/forms/extended/typeahead/bloodhound.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/vendors/js/forms/extended/typeahead/handlebars.js"></script>
<script src="${pageContext.request.contextPath}/assets/vendors/js/forms/extended/formatter/formatter.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/vendors/js/forms/extended/maxlength/bootstrap-maxlength.js"></script>
<script src="${pageContext.request.contextPath}/assets/vendors/js/forms/extended/card/jquery.card.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/scripts/forms/extended/form-inputmask.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/scripts/forms/extended/form-typeahead.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/scripts/forms/extended/form-formatter.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/scripts/forms/extended/form-maxlength.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/scripts/forms/extended/form-card.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/mask-script.js"></script>
<script>
    var phoneMask = IMask(
            document.getElementById('addtelephone'), {
        mask: '0000 00 00'
    });

    var phoneMask = IMask(
            document.getElementById('edittelephone'), {
        mask: '0000 00 00'
    });

    var emalMask = IMask(
            document.getElementById('addemail'),
            {
                mask: [
                    {
                        mask: /^\S*@?\S*$/
                    }
                ]
            });
    var emalMask = IMask(
            document.getElementById('editemail'),
            {
                mask: [
                    {
                        mask: /^\S*@?\S*$/
                    }
                ]
            });

    var nifcinMask = IMask(
            document.getElementById('addnifcin'),
            {
                mask: [
                    {
                        mask: '000-000-000-0'
                    },
                    {
                        mask: '00-00-00-0000-00-00000'
                    },
                    {
                        mask: '0000000000'
                    }
                ]
            });

    var nifcinMask = IMask(
            document.getElementById('editnifcin'),
            {
                mask: [
                    {
                        mask: '000-000-000-0'
                    },
                    {
                        mask: '00-00-00-0000-00-00000'
                    },
                    {
                        mask: '0000000000'
                    }
                ]
            });

    var adddatenaissance = IMask(
            document.getElementById('adddatenaissance'),
            {
                mask: Date,
                min: new Date(1990, 0, 1),
                max: new Date(),
                lazy: false
            });

    var edditdatenaissance = IMask(
            document.getElementById('edditdatenaissance'),
            {
                mask: Date,
                min: new Date(1990, 0, 1),
                max: new Date(),
                lazy: false
            });
</script>