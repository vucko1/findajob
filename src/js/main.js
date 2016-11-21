window.onload = function() {
    // redirect to job openings on init
    FJ.Navigation.NavigateToRoute(FJ.Navigation.Routes.User.JobOpenings);
}

// HTML DOM element members (expand the DOM API with basic functions since we're not allowed to use jQuery :). )
HTMLElement.prototype.removeClass = function (remove) {
    var newClassName = "";
    var i;
    var classes = this.className.split(" ");
    for (i = 0; i < classes.length; i++) {
        if(classes[i] !== remove) {
            newClassName += classes[i] + " ";
        }
    }
    this.className = newClassName;
}

HTMLElement.prototype.addClass = function (className) {
    this.className += ' ' + className;
}

function collapseExpand() {
    var menu = document.getElementsByClassName('menu-list')[0];
    var expanded = menu.getAttribute('data-expanded');

    if (expanded == "true") {
        menu.removeClass('menu-list-expanded');
        menu.setAttribute('data-expanded', 'false');
    }
    else {
        menu.className += ' menu-list-expanded';
        menu.setAttribute('data-expanded', 'true');
    }
}

function logout() {
    window.location.pathname = "/login.html"
}