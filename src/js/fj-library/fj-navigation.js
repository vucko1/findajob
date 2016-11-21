var FJ = FJ || {}
FJ.Navigation = FJ.Navigation || {};
FJ.Navigation.Routes = FJ.Navigation.Routes || {};
FJ.Resources = FJ.Resources || {};

vm = null;

FJ.Navigation.Routes = {
    User: {
        JobOpenings: {
            Route: "user/jobopenings.html",
            MenuItem: "menu-list-jobopenings",
            Title: FJ.Resources.Navigation.Title.User.JobOpenings
        },
        Profile: {
            Route: "user/profile.html",
            MenuItem: "menu-list-profile",
            Title: FJ.Resources.Navigation.Title.User.Profile,
        },
        Companies: {
            Route: "user/companies.html",
            MenuItem: "menu-list-companies",
            Title: FJ.Resources.Navigation.Title.User.Companies
        }
    },
    Login: {
        Route: "../login.html",
        Title: FJ.Resources.Navigation.Title.Login
    }
};

FJ.Navigation.NavigateToRoute = function(route) {
 
    if (FJ.IsUndefinedOrNull(route))
        return;
    
    var xhr= new XMLHttpRequest();
	xhr.open('GET', route.Route, true);
	xhr.onreadystatechange= function() {
		if (this.readyState!==4) return;
		if (this.status!==200) return;
		
        // set title
        document.getElementsByClassName('ph-menu-page-title')[0].innerHTML = document.title = route.Title;
        
        // clear all "activePage" classes from menu and set the current active page
        var activePage = document.getElementsByClassName('activePage');
        if (activePage.length > 0)
            activePage[0].removeClass('activePage');
        
        if (!FJ.IsUndefinedOrNullOrEmpty(route.MenuItem))
            document.getElementById(route.MenuItem).addClass("activePage");
        
        // apply content to container
		document.getElementById("container-partial-view").innerHTML= this.responseText;
        
        FJ.Navigation.ClearHash();
        
        // assign view model
        switch (route) {
            
            case FJ.Navigation.Routes.User.Profile:
                vm = new FJ.ViewModels.UserProfile();
                break;
            case FJ.Navigation.Routes.User.Companies:
                vm = new FJ.ViewModels.Companies();
                break;
            default:
                break;
        }
	};
	
	xhr.send();
}

FJ.Navigation.ClearHash = function() {
    if (location.hash == "#popup-wrapper")
        location.hash = "";
}