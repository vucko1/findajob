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
		gender: 1,
		country: userModel.basicInfo.country.value(),
		city: userModel.basicInfo.city.value(),
		email: userModel.basicInfo.email.value(),
		profilePicture: userModel.basicInfo.profilePicture.value()
	};
	
	userDbModel.profession = {
		college: userModel.profession.college.value(),
		graduationYear: userModel.profession.graduationYear.value(),
		title: userModel.profession.title.value(),
		status: userModel.profession.status.value(),
		profession: userModel.profession.profession.value()
	}
	
	userDbModel.password = (!FJ.IsUndefinedOrNullOrEmpty(userModel.password.newPassword.value())) ? userModel.password.ewPassword.value() : userModel.password.oldPassword.value();
	userDbModel.resume = 1;
	
	FJ.Http.Put(FJ.Http.BaseUri + "userprofile.php", userDbModel, successCallback, errorCallback);
}

FJ.DAL.User.GetCompanies = function (successCallback, errorCallback) {
	FJ.Http.Get(FJ.Http.BaseUri + "companies.php", successCallback, errorCallback);
}

FJ.DAL.User.FilterCompanies = function (parameter, successCallback, errorCallback) {
	FJ.Http.Get(FJ.Http.BaseUri + "searchcompanies.php?filter=" + parameter, successCallback, errorCallback);
}