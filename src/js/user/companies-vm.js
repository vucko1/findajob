var FJ = FJ || {};
FJ.ViewModels = FJ.ViewModels || {};

FJ.ViewModels.Companies = function() {
    
    var self = this,
        activeCompanyIndex = null,  // change this after
        totalNumberOfCompanies = 3; // backend is introduced
    
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