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

}, showAlert = function(msg, btnclose){
	
	alert(msg);
	
	if( $btn!=undefined ){
		$btn.button('reset');
	}
	return false;
    closePopup();
    jQuery('#generalAlert, .overlay').fadeIn('fast', function(){
        if( btnclose!=undefined ){
            jQuery('.close').fadeOut(0);
        }else{
            jQuery('.close').fadeIn(0);
        }        
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
}, lastStep = function(){
		
	var items = [];
    var asientos=[];
    $("input[name='columna']:checkbox:checked").each( function() {
        items.push($(this));
    });
    
    jQuery('#reservaAsientos').children().remove();
    jQuery('#selectmostrartasientos').children().remove();
    if( items.length > 0 ){    	
	    jQuery('.step-2').fadeOut('slow', function(){
			jQuery('.step-3').fadeIn();
			jQuery('.icon-steps li').removeClass('active');
			jQuery('.icon-steps li:eq(2)').addClass('active');
		});
	    
	    var texto = "";
	    $.each( items, function(i, l){	    	
	        var columna=$(l).val();
	        var fila=$(l).attr("id");
	        texto += jQuery("#asientos th:eq("+ columna +")").html() + " " + jQuery("#asientos td.hour:eq("+ (fila-1) +")").html() + '<br>';	        
	        valor=i+1;
	        console.log( jQuery("#asientos th:eq("+ columna +")").html() );
	        $('#reservaAsientos').append('<input type="hidden" name="asientoc'+valor+'"  value="'+columna+'" />');
	        $('#reservaAsientos').append('<input type="hidden" name="asientof'+valor+'"  value="'+fila+'" />');        	           	                    	        
	    });
	    jQuery("#detailhour").html(texto);
    }    
    
    jQuery('#cantbutacas').attr("value",items.length);
    jQuery('.total').html( (items.length * parseInt( jQuery('.precio').html() ) ) );
    console.log(items);
    return false;    
    
}, prevStep = function( step ){
	jQuery('.step-'+ step).fadeOut('fast', function(){
		jQuery('.step-'+ (step-1)).fadeIn();
	});
	jQuery('.icon-steps li').removeClass('active');
	jQuery('.icon-steps li:eq('+(step-2)+')').addClass('active');
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
			jQuery('#ReservaIdFucion').attr("value",jQuery(this).attr('data-function'));			
			ajax('Procesa.jsp?method=getfield', {
				id: jQuery(this).attr('data-field'),
				idSede: jQuery(this).attr('data-sede'),
				idFuncion: jQuery(this).attr('data-function')
			});
			
			var html = '';
			html += '<tr>';
				html += '<td>' + jQuery(this).find('.sede').html() + '</td>';
				html += '<td>' + jQuery(this).find('.cancha').html() + '</td>';
				html += '<td class="precio">' + jQuery(this).find('.precio').html() + '</td>';
				html += '<td class="total"></td>';
			html += '</tr>';
			
			jQuery('#reserva-confimacion').html( html );
			
		});
		  
    }
});