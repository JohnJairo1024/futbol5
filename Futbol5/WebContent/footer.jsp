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

	<div class="modal fade" id="loginModal" tabindex="-1" role="dialog" aria-labelledby="loginModalLabel">
	  	<div class="modal-dialog" role="document">
		    <div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
					<h4 class="modal-title">Iniciar sesión</h4>
				</div>
				<form id="login">
					<div class="modal-body">					
					  <div class="form-group">
					    <label for="Usuario" class="control-label">Usuario:</label>
					    <input type="text" class="form-control longinput required" id="Usuario" name="Usuario">
					  </div>
					  <div class="form-group">
					    <label for="password" class="control-label">Password:</label>
					    <input type="password" class="form-control longinput required" id="password" name="Password">
					  </div>
					  <div class="form-group">
					  	<p class="error-message"></p>
					  </div>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-submit">Continuar</button>
					</div>
				</form>					
		    </div>
	  	</div>
	</div>
	
	<div class="modal fade" id="registroModal" tabindex="-1" role="dialog" aria-labelledby="registroModalLabel">
	  	<div class="modal-dialog" role="document">
		    <div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
					<h4 class="modal-title">Iniciar sesión</h4>
				</div>
				<form id="registro">
					<div class="modal-body">					
					  <div class="form-group">
					    <label for="Usuario" class="control-label">Usuario:</label>
					    <input type="text" class="form-control required" id="Usuario" name="Usuario">
					  </div>
					  <div class="form-group">
					    <label for="password" class="control-label">Password:</label>
					    <input type="password" class="form-control required" id="password" name="Password">
					  </div>
					  <div class="form-group">
					    <label for="nombre" class="control-label">Nombre:</label>
					    <input type="text" class="form-control required" id="nombre" name="nombre">
					  </div>
					  <div class="form-group">
					    <label for="apellido" class="control-label">Apellido:</label>
					    <input type="text" class="form-control required" id="apellido" name="apellido">
					  </div>
					  <div class="form-group">
					    <label for="dni" class="control-label">DNI:</label>
					    <input type="text" class="form-control required" id="dni" name="dni">
					  </div>
					  <div class="form-group">
					  	<p class="error-message"></p>
					  </div>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-submit">Continuar</button>
					</div>
				</form>					
		    </div>
	  	</div>
	</div>

	<script type="text/javascript" src="resources/javascript/jquery.js"></script>
	<script type="text/javascript" src="vendor/bootstrap/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="resources/javascript/main.js"></script>
	<script type="text/javascript" src="resources/javascript/jquery.flexslider-min.js"></script>

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

		}
		cargaIndex();
	</script>



</body>
</html>