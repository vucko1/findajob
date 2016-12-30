var FJ = FJ || {};
FJ.Http = FJ.Http || {};
FJ.Http.BaseUri = FJ.Http.BaseUri || "http://localhost:8080/wtproj/service/";

// makes GET request on specified uri. In case of 200 invokes successCallback, in any other case errorCallback is invoked
FJ.Http.Get = function(uri, successCallback, errorCallback) {
	
	var xhr = new XMLHttpRequest();
	xhr.open('GET', uri, true);
	xhr.onreadystatechange= function() {
		if (this.readyState !== 4) return;
		if (this.status !== 200 && errorCallback != undefined) errorCallback(this);
		successCallback(this);
	};
	
	xhr.send();	
}

// makes PUT request on specified uri. In case of 200 invokes successCallback, in any other case errorCallback is invoked
FJ.Http.Put = function(uri, body, successCallback, errorCallback) {
	
	var xhr = new XMLHttpRequest();
	xhr.open('PUT', uri, true);

	xhr.onreadystatechange= function() {
		if (this.readyState !== 4) return;
		if (this.status !== 200 && errorCallback != undefined) errorCallback(this);
		successCallback(this);
	};
	
	xhr.send(JSON.stringify(body));	
}