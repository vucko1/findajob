var FJ = FJ || {}
FJ.Library = FJ.Library || {};
fj = FJ.Library; // shorthand :)

/* Returns an object with properties:
 *    value - DOM.value - useful for input elements
 *    DOM - DOM - returns a DOM element
 *  
 * Second parameter is extra properties. They are mapped to an observable, so one can pass additional fields for an object (error messages, functions etc)
 */
fj.observable = function(idSelector, extraProperties) {
    
    var DOMelement = document.getElementById(idSelector);
    
    if (!FJ.IsUndefinedOrNull(DOMelement) && DOMelement.nodeType && DOMelement.nodeType === 1) {
        var observableObjectResult = {
            value: function(val) {
                DOMelement = document.getElementById(idSelector);
                
                if (!FJ.IsUndefinedOrNull(val))
                    DOMelement.value = val;
                
                return DOMelement.value;
            },
            DOM: function() {
                return document.getElementById(idSelector);
            }
        };

        // extend base object with extra properties, if needed
        for (var attr in extraProperties) {
            if (typeof(extraProperties[attr]) === "function")
                observableObjectResult[attr] = function() {
                    return extraProperties[attr](observableObjectResult);
                }
            else
                observableObjectResult[attr] = extraProperties[attr];
        }

        return observableObjectResult;
    }
    
    return undefined;
};