var FJ = FJ || {};
FJ.ViewModels = FJ.ViewModels || {};

FJ.ViewModels.Companies = function() {
    
    var self = this,
        activeCompanyIndex = null,  // change this after
        totalNumberOfCompanies = null,
		filter = null; // backend is introduced
    
    // PUBLIC
    self.openCompanyPopup = function(index) {
        var company = getCompanyInfo(index);

        openPopup(company.name, company.description);
        activeCompanyIndex = index;
    }
    
    self.carouselGoLeft = function() {
        if (activeCompanyIndex === 0)
            changePopupCompaniesContent(totalNumberOfCompanies);
        else
            changePopupCompaniesContent(activeCompanyIndex - 1);
    }

    self.carouselGoRight = function() {
        if (activeCompanyIndex === totalNumberOfCompanies)
            changePopupCompaniesContent(0);
        else
            changePopupCompaniesContent(activeCompanyIndex + 1);
    }
	
	self.filterCompanies = function() {
		FJ.DAL.User.FilterCompanies(filter.value(), function(resp) {
			document.getElementById('companies').getElementsByTagName('tbody')[0].innerHTML = "";
			
			var companies = JSON.parse(resp.response);
			
			for (var i = 0; i < companies.length; i ++)
				generateNewTableRowForCompany(companies[i], i);
				
			totalNumberOfCompanies = companies.length - 1;
		}, function (err) { });
	}

	var generateNewTableRowForCompany = function(company, id) {
		var companies = document.getElementById('companies').getElementsByTagName('tbody')[0];
		
		var row = document.createElement('tr'),
			name = document.createElement('td'),
			place = document.createElement('td'),
			orientation = document.createElement('td'),
			noOfEmployees = document.createElement('td'),
			noOfJobOpenings = document.createElement('td'),
			description = document.createElement('td');
		
		description.addClass('description');
		
		name.innerHTML = company.name;
		place.innerHTML = company.place;
		orientation.innerHTML = company.orientation;
		noOfEmployees.innerHTML = company.noOfEmployees;
		noOfJobOpenings.innerHTML = company.noOfJobOpenings;
		description.innerHTML = company.description;
		
		row.appendChild(name)
		row.appendChild(place)
		row.appendChild(orientation)
		row.appendChild(noOfEmployees)
		row.appendChild(noOfJobOpenings)
		row.appendChild(description);
		
		row.onclick = function() {
			self.openCompanyPopup(id);
		};
		
		companies.appendChild(row);
	}
    
	var getCompanies = function() {
		FJ.DAL.User.GetCompanies(function(resp) {
			var companies = JSON.parse(resp.response);
				
			for (var i = 0; i < companies.length; i ++)
				generateNewTableRowForCompany(companies[i], i);
				
			totalNumberOfCompanies = companies.length - 1;
		}, function (err) { });
	}
	
	var init = function() {
		filter = fj.observable('company-filter');
	}
	
	getCompanies();
	init();
 
	// PRIVATES	
    getCompanyInfo = function(index) {
        var row = document.getElementById('companies').getElementsByTagName('tbody')[0].getElementsByTagName('tr')[index];

        var companyInfo = row.getElementsByTagName('td');

        return {
            name : companyInfo[0].innerHTML,
            description : companyInfo[5].innerHTML
        }   
    }

    openPopup = function(title, content) {
        var popup = document.getElementById("popup-wrapper");

        // set title
        popup.getElementsByTagName('h2')[0].innerHTML = title;

        // set content
        popup.getElementsByClassName('content')[0].innerHTML = content;

        // open popup
        location.hash = "popup-wrapper"
    }

    changePopupCompaniesContent = function(index) {
        var company = getCompanyInfo(index);
        activeCompanyIndex = index;

        var popup = document.getElementById("popup-wrapper");

        // set title
        popup.getElementsByTagName('h2')[0].innerHTML = company.name;

        // set content
        popup.getElementsByClassName('content')[0].innerHTML = company.description;
    }
    
    return self;
}