
(function($, document, window) {
  "use strict";
  return $(function() {
    $.fn.exists = function() {
      return $(this).length > 0;
    };
    return $(document).ready(function() {
      var alertLiveCookie, hostName, i, isPlaceholderSupported, links, placeholdersupport, _results;
      isPlaceholderSupported = function() {
        var input;
        input = document.createElement("input");
        return "placeholder" in input;
      };
      $(".downloadPopover").hover(function() {
        return $(this).popover("toggle");
      });
      hostName = window.location.hostname;
      links = $("a");
      alertLiveCookie = $.cookie("alertLive");
      i = 0;
      if (alertLiveCookie !== "hidden") {
        $(".alertLive").removeClass("hidden");
        $(".alertLive .close").click(function() {
          return $.cookie("alertLive", "hidden", {
            expires: 1,
            path: "/"
          });
        });
      }
      $(".alert").alert();
      $(".carousel").carousel({
        interval: 6000
      });
      // $('#teachingTab a:first').tab('show');
      $('#teachingTab a').click(function (e) {
        e.preventDefault();
        $(this).tab('show');
      });
      $('#teachingTab a[href="#video"]').tab('show');
      $('audio').mediaelementplayer({
        videoWidth: '100%',
        videoHeight: '100%',
        audioWidth: '100%',
        features: ['playpause', 'progress', 'tracks', 'volume'],
        videoVolume: 'horizontal'
      });
      placeholdersupport = isPlaceholderSupported();
      if (placeholdersupport === false) {
        $(".search-query").val("Search");
      }
      $(".search-query").focus(function() {
        if (placeholdersupport === false ? $(this).val() === "Search" : void 0) {
          return $(this).val("");
        }
      });
      $(".search-query").blur(function() {
        if (placeholdersupport === false ? $(this).val() === "" : void 0) {
          return $(this).val("Search");
        }
      });
      i = 0;
      _results = [];
      while (i < links.length) {
        if (links[i].href.indexOf(hostName) === -1) {
          links[i].setAttribute("target", "_blank");
        }
        _results.push(i += 1);
      }
      return _results;
    });
  });
})(jQuery, document, window);