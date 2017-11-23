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
};

jQuery( ".soccer-fields img" ).bind('error', function() {
	jQuery(this).attr( "src", "http://via.placeholder.com/120x120" );
});

jQuery(document).ready(function () {
	jQuery('#loader').fadeOut();

	jQuery('.btn-login').on('click', function(e){
		e.preventDefault();
		jQuery('#loginModal').modal();
	});
	
	// Submit a form via ajax
    jQuery('.btn-submit').on('click', function(e) {
      e.preventDefault();
       ajaxForm(jQuery(this).closest('form'));
    });
});