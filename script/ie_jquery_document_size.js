( function ( $ ) {
    
    var getPropIE = function ( name ) {
        
        return Math.max(
            document.documentElement["client" + name],
            document.documentElement["scroll" + name],
            document.body["scroll" + name]
        );
        
    }
    
    $.fn.trueWidth = function() {  
        
        return ( ( $.browser.msie && this.get()[0].nodeType === 9 ) ? getPropIE( 'Width' ) : this.width() );
        
    };
    
    $.fn.trueHeight = function() {  
        
        return ( ( $.browser.msie && this.get()[0].nodeType === 9 ) ? getPropIE( 'Height' ) : this.height() );
        
    };
    
} )( jQuery );