	<script type="text/javascript" src="js/jquery.min.js"></script>
	<script type="text/javascript" src="js/jquery.form.js" type="text/javascript"></script>
	<script type="text/javascript" src="js/plugins/jquery.smartWizard-2.0.min.js"></script>
	<script type="text/javascript" src="js/jquery.validate.min.js"></script>
	<script type="text/javascript" src="js/error.js"></script>
	<script type="text/javascript" src="js/jquery.flexslider-min.js"></script>
	<script type="text/javascript" src="js/fancy.js"></script>
	<script type="text/javascript" src="js/function_wizard.js"></script>
	<script type="text/javascript" src="js/fancyreservas.js"></script>
	
	<!-- Hook Flexslider -->
	<script type="text/javascript">
		function cargaIndex() {
			$(document).ready(function() {
				jQuery('.flexslider').flexslider({
					animation : "fade",
					animationDuration : 600,
					directionNav : false,
					controlNav : true
				});

			});

			$(document).ready(function() {
				$('#window').fancy();
				$('#trailer').fancy();
				$('#reserva').function_wizard();
				$('#misreservas').fancyreservas();
			})

			$(document).ready(function() {
				$('#salir').click(function(e) {
					var url = $(this).attr('href');
					$('#bodychild').load(url);
					e.preventDefault();
				})
			});
		}
		cargaIndex();
	</script>



</body>
</html>