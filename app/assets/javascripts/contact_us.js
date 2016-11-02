var messageDelay = 2000;

// Init the form once the document is ready
$( contact_us_init );

// Initialize the form
function contact_us_init() {

    $('#contactForm').show().submit( submitForm ).addClass( 'positioned' );

    $('a[href="#contact_form"]').click( function() {
        $('#contactForm').fadeTo( 'slow', .2 );
        $('#contactForm').fadeIn( 'slow', function() {
            $('#ContactFormName').focus();
        } )

        return false;
    } );

}

// Submit the form via Ajax
function submitForm() {
    var contactForm = $(this);

    if ( !$('#ContactFormName').val() || !$('#ContactFormEmail').val() || !$('#ContactFormMessage').val() ) {
        $('#incompleteMessage').fadeIn().delay(messageDelay).fadeOut();
        contactForm.fadeOut().delay(messageDelay).fadeIn();
    } else {
        $('#sendingMessage').fadeIn();
        contactForm.fadeOut();
        $.ajax( {
            url: contactForm.attr( 'action' ) + "?ajax=true",
            type: contactForm.attr( 'method' ),
            data: contactForm.serialize(),
            success: submitFinished
        } );
    }
    // Prevent the default form submission occurring
    return false;
}

// Handle the Ajax response
function submitFinished( response ) {
    response = $.trim( response );
    $('#sendingMessage').fadeOut();

    if ( response == "success" ) {

        $('#successMessage').fadeIn().delay(messageDelay).fadeOut();
        $('#ContactFormName').val( "" );
        $('#ContactFormEmail').val( "" );
        $('#ContactFormPhone').val( "" );
        $('#ContactFormMessage').val( "" );

        $('#contactForm').delay(messageDelay+500).fadeIn();
        setTimeout(function(){
            $('.fancybox-item.fancybox-close').click();
        }, 3000);

    } else {
        $('#failureMessage').fadeIn().delay(messageDelay).fadeOut();
        $('#contactForm').delay(messageDelay+500).fadeIn();
    }
}
