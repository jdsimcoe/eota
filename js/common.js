
(function($, document, window) {
  "use strict";
  return $(function() {
    $.fn.exists = function() {
      return $(this).length > 0;
    };
    return $(document).ready(function() {
      $(".carousel").carousel({
        interval: 10000
      });
      $('#Button50').click(function(){
        var token = function(res){
          var $input = $("<input type=hidden name=stripeToken />").val(res.id);
          $('form').append($input).submit();
        };

        StripeCheckout.open({
          key:         'pk_test_czwzkTp2tactuLOEOqbMTRzG',
          address:     true,
          amount:      5000,
          name:        'Joes Pistachios',
          description: 'A bag of Pistachios',
          panelLabel:  'Checkout',
          token:       token
        });

        return false;
      });
    });
  });
})(jQuery, document, window);