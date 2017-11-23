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


	<div class="overlay popup"></div>

	<div class="box-alert popup" id="generalAlert">
		<a class="close" href="javascript:closePopup();">X</a>
		<div class="box">
			<h1 class="center" id="titleAlert"></h1>
			<p id="messageAlert"></p>
		</div>
	</div>

	<div class="modal fade" id="loginModal" tabindex="-1" role="dialog" aria-labelledby="loginModalLabel">
	  	<div class="modal-dialog" role="document">
		    <div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
					<h4 class="modal-title">Iniciar sesión</h4>
				</div>
				<form id	="login2">
					<div class="modal-body">					
					  <div class="form-group">
					    <label for="Usuario" class="control-label">Usuario:</label>
					    <input type="text" class="form-control longinput required" id="Usuario" name="Usuario">
					  </div>
					  <div class="form-group">
					    <label for="password" class="control-label">Password:</label>
					    <input type="password" class="form-control longinput required" id="password" name="Password">
					  </div>					
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-submit">Continuar</button>
					</div>
				</form>					
		    </div>
	  	</div>
	</div>

	<script type="text/javascript" src="javascript/jquery.js"></script>
	<script type="text/javascript" src="vendor/bootstrap/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="javascript/main.js"></script>
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