//= require screenfull/dist/screenfull

(function(window, document, $, undefined){
  if ( typeof screenfull === 'undefined' ) return;
  $(function(){
    var $doc = $(document);
    var $fsToggler = $('[data-toggle-fullscreen]');

    // Not supported under IE
    var ua = window.navigator.userAgent;
    if( ua.indexOf("MSIE ") > 0 || !!ua.match(/Trident.*rv\:11\./) ) {
      $fsToggler.addClass('hide');
    }

    if ( ! $fsToggler.is(':visible') ) // hidden on mobiles or IE
      return;

    $fsToggler.on('click', function (e) {
        e.preventDefault();

        if (screenfull.enabled) {
          screenfull.toggle();
          // Switch icon indicator
          toggleFSIcon( $fsToggler );
        } else {
          console.log('Fullscreen not enabled');
        }
    });

    if ( screenfull.raw && screenfull.raw.fullscreenchange)
      $doc.on(screenfull.raw.fullscreenchange, function () {
          toggleFSIcon($fsToggler);
      });

    function toggleFSIcon($element) {
      if(screenfull.isFullscreen)
        $element.children('em').removeClass('fa-expand').addClass('fa-compress');
      else
        $element.children('em').removeClass('fa-compress').addClass('fa-expand');
    }
  });
})(window, document, window.jQuery);
