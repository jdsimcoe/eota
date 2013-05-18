
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
    });
  });
})(jQuery, document, window);