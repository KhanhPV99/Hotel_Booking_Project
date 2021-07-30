<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="<c:url value="/resources/vendors/jquery/jquery-3.2.1.min.js" />"></script>
<script src="<c:url value="/resources/vendors/bootstrap/bootstrap.bundle.min.js" />"></script>
<script src="<c:url value="/resources/vendors/magnefic-popup/jquery.magnific-popup.min.js" />"></script>
<script src="<c:url value="/resources/vendors/owl-carousel/owl.carousel.min.js" />"></script>
<script src="<c:url value="/resources/vendors/easing.min.js" />"></script>
<script src="<c:url value="/resources/vendors/superfish.min.js" />"></script>
<script src="<c:url value="/resources/vendors/nice-select/jquery.nice-select.min.js" />"></script>
<script src="<c:url value="/resources/vendors/jquery.ajaxchimp.min.js" />"></script>
<script src="<c:url value="/resources/vendors/mail-script.js" />"></script>
<script src="<c:url value="/resources/js/main.js" />"></script>

<!--date-range-->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/js/bootstrap-datepicker.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.4.1/js/bootstrap.js"></script>
<script>
    $(document).ready(function () {

        $('.input-daterange').datepicker({
            format: 'dd-mm-yyyy',
            todayHighlight: true,
            startDate: '0d'
        });

    });
</script>