var FJ = FJ || {};
FJ.DAL = FJ.DAL || {};
FJ.DAL.User = FJ.DAL.User || {};

FJ.DAL.User.GetProfile = function (successCallback, errorCallback) {
	FJ.Http.Get(FJ.Http.BaseUri + "userprofile.php", successCallback, errorCallback);
}

FJ.DAL.User.SaveProfile = function (userModel, successCallback, errorCallback) {
	
	var userDbModel = {
		basicInfo: {},
		profession: {},
		password: {},
		resume: {}
	};
	
	userDbModel.basicInfo = {
		firstName: userModel.basicInfo.firstName.value(),
		lastName: userModel.basicInfo.lastName.value(),
		dateOfBirth: userModel.basicInfo.dateOfBirth.value(),
		gender: userModel.basicInfo.gender.selected(),
		country: userModel.basicInfo.country.value(),
		city: userModel.basicInfo.city.value(),
		email: userModel.basicInfo.email.value(),
		profilePicture: userModel.profilePicture
	};
	
	userDbModel.profession = {
		college: userModel.profession.college.value(),
		graduationYear: userModel.profession.graduationYear.value(),
		title: userModel.profession.title.value(),
		status: userModel.profession.status.value(),
		profession: userModel.profession.profession.value()
	}
	
	userDbModel.newPassword = userModel.password.newPassword.value();
	userDbModel.password =  userModel.password.oldPassword.value();
	userDbModel.resume = 1;
	
	FJ.Http.Put(FJ.Http.BaseUri + "userprofile.php", userDbModel, successCallback, errorCallback);
}

FJ.DAL.User.GetCompanies = function (successCallback, errorCallback) {
	FJ.Http.Get(FJ.Http.BaseUri + "companies.php", successCallback, errorCallback);
}

FJ.DAL.User.FilterCompanies = function (parameter, successCallback, errorCallback) {
	FJ.Http.Get(FJ.Http.BaseUri + "searchcompanies.php?filter=" + parameter, successCallback, errorCallback);
}

FJ.DAL.User.ToggleBookmark = function(request, successCallback, errorCallback) {
	FJ.Http.Put(FJ.Http.BaseUri + "togglejobbookmark.php", request, successCallback, errorCallback);
}