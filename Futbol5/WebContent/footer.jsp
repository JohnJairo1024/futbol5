	<footer>
		<aside>
			<h4>Siguenos en:</h4>
			<ul>
				<li>
					<a target="_blank" href="http://www.twitter.com">
						<span class="icon-img" style="background-image: url(images/twiiter.png)"></span>
					</a>
				</li>
				<li>
					<a target="_blank" href="http://www.facebook.com">
						<span class="icon-img" style="background-image: url(images/facebook.png)"></span>
					</a>
				</li>
				<li>
					<a target="_blank" href="https://plus.google.com">
						<span class="icon-img" style="background-image: url(images/google.png)"></span>
					</a>
				</li>
			</ul>
		</aside>
		<p class="copy">&copy; Piso Club, todos los derechos reservados</p>
	</footer>

	<script type="text/javascript" src="javascript/jquery.js"></script>
	<script type="text/javascript" src="vendor/bootstrap/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="javascript/jquery.form.js" type="text/javascript"></script>
	<script type="text/javascript" src="javascript/plugins/jquery.smartWizard-2.0.min.js"></script>
	<script type="text/javascript" src="javascript/jquery.validate.min.js"></script>
	<script type="text/javascript" src="javascript/error.js"></script>
	<script type="text/javascript" src="javascript/jquery.flexslider-min.js"></script>
	<script type="text/javascript" src="javascript/fancy.js"></script>
	<script type="text/javascript" src="javascript/function_wizard.js"></script>
	<script type="text/javascript" src="javascript/fancyreservas.js"></script>

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