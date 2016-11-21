var FJ = FJ || {};
FJ.ViewModels = FJ.ViewModels || {};

FJ.ViewModels.Login = function() {

    var self = this,
        loginInfo = null;
    
    var initControls = function() {
        
        loginInfo = {
            username: fj.observable("login-username-input"),
            password: fj.observable("login-password-input"),
            rememberMe: fj.observable("remember-me-checkbox", {
                isChecked: function(rememberMeElement) {
                    return rememberMeElement.DOM().checked;
                }
            })
        }
        
        var loginInfoFromStorage = JSON.parse(localStorage.getItem("fj-login-info"));
        
        if (!FJ.IsUndefinedOrNull(loginInfoFromStorage)) {
            loginInfo.username.value(loginInfoFromStorage.username);
            loginInfo.password.value(loginInfoFromStorage.password);
            loginInfo.rememberMe.DOM().checked = true;
        }
    }
    
    // call on initialization
    initControls();
    
    self.login = function() {
        if (loginInfo.rememberMe.isChecked())
            localStorage.setItem("fj-login-info", JSON.stringify({
                username: loginInfo.username.value(),
                password: loginInfo.password.value()
            }));
        else
            localStorage.removeItem("fj-login-info");
        
        window.location.pathname = "/index.html"
    }
    
    return self;
}

var vm = null;

window.onload = function() {
    vm = new FJ.ViewModels.Login();
}