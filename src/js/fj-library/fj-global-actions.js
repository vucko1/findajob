var FJ = FJ || {};
FJ.Globals = FJ.Globals || {};
FJ.Panel = FJ.Panel || {};

// GLOBAL HELPERS
FJ.IsUndefinedOrNull = function(element) {
    return element === undefined || element === null;
};

FJ.IsUndefinedOrNullOrEmpty = function(element) {
    return element === undefined || element === null || element === "";
};

FJ.ContainsNumber = function(str) {
    return /[0-9]/.test(str);
};

// GLOBAL VARIABLES
FJ.Globals.Gender = {
    Male: 1,
    Female: 2
};

// GLOBAL PANEL HELPRS
FJ.Panel.Hide = function(DOMelement) {
    DOMelement.style.display = "none";
    DOMelement.innerHTML = "";
};

FJ.Panel.ShowMessages = function(DOMelement, messages) {
    DOMelement.innerHTML = messages.join('<br/>')
    DOMelement.style.display = "block";
};