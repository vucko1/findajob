var FJ = FJ || {};
FJ.ViewModels = FJ.ViewModels || {};

FJ.ViewModels.UserProfile = function() {
 
    var self = this, 
        errorPanel = document.getElementById('profile-error-panel'),
        userModel = null,
        fullscreenModal = {
            wrapper: document.getElementsByClassName("fj-picture-fullscreen")[0],
            picture: document.getElementById("fj-picture-fullscreen")
        },
        allowedExtensions = [ "jpg", "jpeg", "gif", "png" ],
        openPreviewPicture = null;
 
    var initControls = function() {
        
        var canNotContainNumbersExtender = {
            isValid: function(element) {
                var str = element.value();
                return !FJ.IsUndefinedOrNullOrEmpty(str) && !FJ.ContainsNumber(str);
            }
        };
        
        var isNotUndefinedOrNullOrEmptyExtender = {
            isValid: function(element) {
                return !FJ.IsUndefinedOrNullOrEmpty(element.value());
            }
        };
        
        // get user basic info
        var userBasicInfo = {
            firstName: fj.observable('pc-firstname', canNotContainNumbersExtender),
            lastName: fj.observable('pc-lastname', canNotContainNumbersExtender),
            dateOfBirth: fj.observable('pc-dateofbirth', isNotUndefinedOrNullOrEmptyExtender),
            country: fj.observable('pc-country', canNotContainNumbersExtender),
            city: fj.observable('pc-city', canNotContainNumbersExtender),
            email: fj.observable('pc-email', {
                isValid: function(emailElement) {
                    return /[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,3}$/.test(emailElement.value())
                }
            }),
            profilePicture: fj.observable('pc-profilepic-input', {
                files: function(picElement) {
                    return picElement.DOM().files;
                }  
            })
        };
        
        var userProfession = {
            college: fj.observable('pc-college'),
            graduationYear: fj.observable('pc-graduationyear', isNotUndefinedOrNullOrEmptyExtender),
            title: fj.observable('pc-title'),
            status: fj.observable('pc-currentstatus', isNotUndefinedOrNullOrEmptyExtender),
            profession: fj.observable('pc-profession', isNotUndefinedOrNullOrEmptyExtender)
        };
        
        var password = {
            oldPassword: fj.observable('pc-oldpassword', isNotUndefinedOrNullOrEmptyExtender),
            newPassword: fj.observable('pc-newpassword', isNotUndefinedOrNullOrEmptyExtender),
            newPasswordRepeat: fj.observable('pc-repeatnewpassword', isNotUndefinedOrNullOrEmptyExtender)
        };
        
        // gender
        // resume
        // profile pic
        
        var skills = {};
        
        var userModelResult = {
            basicInfo: userBasicInfo,
            profession: userProfession,
            password: password,
            skills: skills
        };
        
        userModel = userModelResult;
    }
    
	var getUserProfile = function() {
		FJ.DAL.User.GetProfile(function(resp) {
			var data = JSON.parse(resp.response);
			
			// set data
			userModel.basicInfo.firstName.value(data.basicInfo.firstName);
			userModel.basicInfo.lastName.value(data.basicInfo.lastName);
			userModel.basicInfo.dateOfBirth.value(data.basicInfo.dateOfBirth);
			userModel.basicInfo.country.value(data.basicInfo.country);
			userModel.basicInfo.city.value(data.basicInfo.city);
			userModel.basicInfo.email.value(data.basicInfo.email);

			userModel.profession.college.value(data.profession.college);
			userModel.profession.graduationYear.value(data.profession.graduationYear);
			
			if (!FJ.IsObjectEmpty(data.profession.title))
				userModel.profession.title.value(data.profession.title);
			
			userModel.profession.status.value(data.profession.status);
			userModel.profession.profession.value(data.profession.profession);
			
		}, function(resp) {
			FJ.Panel.ShowMessages(errorPanel, [ "An error ocurred while fetching user data, please try again." ]);
		});
	}
	
    // INIT
    initControls();
	getUserProfile();
	
    self.saveUserProfileChanges = function() {
        var validationResult = validateUserProfile();

        if (validationResult) {
            FJ.DAL.User.SaveProfile(userModel, function (resp) {
				console.log(resp.response);
			}, function (resp) {
				
			});
        }
        else {

        }
    }
    
    self.previewNewProfilePicture = function() {
        var files = userModel.basicInfo.profilePicture.files();
        
        if (!FJ.IsUndefinedOrNull(files) && files.length > 0) {
            
            openPreviewPicture = allowedExtensions.indexOf(files[0].name.split('.')[1].toLowerCase()) >= 0;
                
            if (!openPreviewPicture)
                return;
                
            var reader = new FileReader();
            
            reader.onload = function(e) {
                fullscreenModal.picture.src = e.target.result;
            };
            
            reader.readAsDataURL(files[0]);
        }
    }
    
    self.openFullscreenImage = function() {
        
        if (!openPreviewPicture)
            return;
        
        var files = userModel.basicInfo.profilePicture.files();
        
        if (!FJ.IsUndefinedOrNull(files) && files.length > 0) {
            
            fullscreenModal.wrapper.style.display = "flex";

            document.onkeydown = function(evt) {
                evt = evt || window.event;

                if (evt.keyCode === 27)
                    fullscreenModal.wrapper.style.display = "none";
            }
        }
    }
    
    var validateUserProfile = function() {

        var validateUserFieldsResult = validateUserFields(userModel);
        
        if (!validateUserFieldsResult.status)
            FJ.Panel.ShowMessages(errorPanel, validateUserFieldsResult.errors);
        else
            FJ.Panel.Hide(errorPanel);
        
        return validateUserFieldsResult.status;
    }

    // HELPERS
    var validateUserFields = function(userModel) {
        
        var result = {
            status: true,
            errors: []
        };
        
        var markAsInvalid = function(message) {
            result.status = false;
            result.errors.push(message);
        };
        
        // check required fields
        if (!userModel.basicInfo.firstName.isValid())
            markAsInvalid(FJ.Resources.User.Validation.FirstNameMessage);
        if (!userModel.basicInfo.lastName.isValid())
            markAsInvalid(FJ.Resources.User.Validation.LastNameMessage);
        if (!userModel.basicInfo.dateOfBirth.isValid())
            markAsInvalid(FJ.Resources.User.Validation.DateOfBirthMessage);
        if (!userModel.basicInfo.email.isValid())
            markAsInvalid(FJ.Resources.User.Validation.EmailMessage);
        if (!userModel.profession.graduationYear.isValid())
            markAsInvalid(FJ.Resources.User.Validation.GraduationYearMessage);
        if (!userModel.profession.status.isValid())
            markAsInvalid(FJ.Resources.User.Validation.ProfessionStatusMessage);
        if (!userModel.profession.profession.isValid())
            markAsInvalid(FJ.Resources.User.Validation.ProfessionMessage);
        if (!userModel.password.oldPassword.isValid())
            markAsInvalid(FJ.Resources.User.Validation.OldPasswordMessage);
        
        // check optional fields
        if (!FJ.IsUndefinedOrNullOrEmpty(userModel.basicInfo.country.value()) && !userModel.basicInfo.country.isValid())
            markAsInvalid(FJ.Resources.User.Validation.CountryMessage);
        
        if (!FJ.IsUndefinedOrNullOrEmpty(userModel.basicInfo.city.value()) && !userModel.basicInfo.city.isValid())
            markAsInvalid(FJ.Resources.User.Validation.CityMessage);        
        
        if ((!FJ.IsUndefinedOrNullOrEmpty(userModel.password.newPassword.value()) || !FJ.IsUndefinedOrNullOrEmpty(userModel.password.newPasswordRepeat.value()))
                && userModel.password.newPassword.value() !== userModel.password.newPasswordRepeat.value())
            markAsInvalid(FJ.Resources.User.Validation.NewPasswordMessage);
           
        return result;
    }
    
    return self;
}
