function openCompanyPopup(index) {
    var row = document.getElementById('companies').getElementsByTagName('tbody')[0].getElementsByTagName('tr')[index];
    
    var companyInfo = row.getElementsByTagName('td');
    
    var company = {
        name : companyInfo[0].innerHTML,
        description : companyInfo[5].innerHTML
    }
    
    openPopup(company.name, company.description);
}

function openPopup(title, content) {
    var popup = document.getElementById("popup-wrapper");

    // set title
    popup.getElementsByTagName('h2')[0].innerHTML = title;

    // set content
    popup.getElementsByClassName('content')[0].innerHTML = content;

    // open popup
    location.hash = "popup-wrapper"
}