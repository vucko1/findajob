window.onload = function() {
    // redirect to job openings or my jobs (whether user or company is logged in)
    if (document.getElementById("default-opened-site").value == 1)
		FJ.Navigation.NavigateToRoute(FJ.Navigation.Routes.Company.MyJobs);
	else
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
    window.location.href = "logout.php"
}

function toggleBookmark(jobId, action, element) {
	FJ.DAL.User.ToggleBookmark({
		job_id: jobId,
		action: action
	}, function (resp) {
		if (action == 1) {
			element.removeClass("not-starred");
			element.addClass("starred");
		}
		else {
			element.removeClass("starred");
			element.addClass("not-starred");
		}
	}, function (resp) {
		
	});
}

function saveCompany() {
	FJ.DAL.Company.SaveCompany({
		name: document.getElementById("pc-name").value,
		place: document.getElementById("pc-place").value,
		orientation: document.getElementById("pc-orientation").value,
		description: document.getElementById("pc-description").value,
		noofemployees: document.getElementById("pc-noofemployees").value,
	}, function (resp) {
		
	}, function (resp) {
		
	});
}

function createNewJob() {
	FJ.DAL.Company.NewJob({
		title: document.getElementById("pc-title").value,
		description: document.getElementById("pc-description").value,
	}, function (resp) {
		
	}, function (resp) {
		
	});
}

function deleteJob(id) {
	FJ.DAL.Company.DeleteJob(id, function (resp) {
		
	}, function (resp) {
		
	});
}