var $btn;

var ajax = function(urlFragment, data) {
  jQuery("#loader").fadeIn("slow");
	var req = $.ajax({
      data: data,
      dataType: 'JSON',
      type: 'POST',
      url: URL_BASE + urlFragment
    });

    req.done(function(r) { if(r.event) { jQuery("#loader").fadeOut("slow"); eval(r.event); } });
}, ajaxForm = function($form) {
	ajax('Procesa.jsp?method=' + $form.attr('id'), $form.serialize());

}, showAlert = function(title, msg, btnclose){
    closePopup();
    jQuery('#generalAlert, .overlay').fadeIn('fast', function(){
        if( btnclose!=undefined ){
            jQuery('.close').fadeOut(0);
        }else{
            jQuery('.close').fadeIn(0);
        }
        jQuery('#titleAlert').html( title );
        jQuery('#messageAlert').html( msg );
    });

}, closePopup = function(){
    jQuery('.popup').fadeOut();
}, messageError = function( msg ){
	jQuery('.error-message').fadeIn('fast', function(){
		setTimeout(function(){
			jQuery('.error-message').fadeOut('slow');
			if( $btn!=undefined ){
				$btn.button('reset');
			}
		}, 3000);
	}).html( msg );
}, showStepTwo = function( content ){
	jQuery('#fieldsReserv').html( content );
	jQuery('.step-1').fadeOut('slow', function(){
		jQuery('.step-2').fadeIn();
		jQuery('.icon-steps li').removeClass('active');
		jQuery('.icon-steps li:eq(1)').addClass('active');
	});
};

jQuery( ".soccer-fields img" ).bind('error', function() {
	jQuery(this).attr( "src", "http://via.placeholder.com/120x120" );
});

jQuery(document).ready(function () {
	jQuery('#loader').fadeOut();

	jQuery('.btn-login').on('click', function(e){
		e.preventDefault();
		jQuery('#loginModal').modal({
			backdrop: false,
			keyboard: false
		});
	});
	
	jQuery('.btn-registro').on('click', function(e){
		e.preventDefault();
		jQuery('#registroModal').modal({
			backdrop: false,
			keyboard: false
		});
	});
	
	// Submit a form via ajax
    jQuery('.btn-submit').on('click', function(e) {
      e.preventDefault();      
       ajaxForm(jQuery(this).closest('form'));
       $btn = $(this).button('loading');       
    });
    
    if( jQuery('.page-reserva').length > 0 ){
    		jQuery('.step-1 .click').on('click', function(){
    			ajax('Procesa.jsp?method=getfield', {
    				id: jQuery(this).attr('data-field'),
    				idSede: jQuery(this).attr('data-sede'),
    				idFuncion: jQuery(this).attr('data-function')
    			});
    		});
    }
});