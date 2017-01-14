var FJ = FJ || {};
FJ.DAL = FJ.DAL || {};
FJ.DAL.Company = FJ.DAL.Company || {};

FJ.DAL.Company.SaveCompany = function(request, successCallback, errorCallback) {
	FJ.Http.Put(FJ.Http.BaseUri + "savecompany.php", request, successCallback, errorCallback);
}

FJ.DAL.Company.NewJob = function(request, successCallback, errorCallback) {
	FJ.Http.Post(FJ.Http.BaseUri + "newjob.php", request, successCallback, errorCallback);
}

FJ.DAL.Company.DeleteJob = function (id, successCallback, errorCallback) {
	FJ.Http.Get(FJ.Http.BaseUri + "deletejob.php?id=" + id, successCallback, errorCallback);
}