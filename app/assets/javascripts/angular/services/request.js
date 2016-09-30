function RequestService($resource) {
    function Request() {
        this.service = $resource('/api/v1/requests.json', {}, {query: {isArray: false}});
    }

    Request.prototype.create = function(data, onSuccessCallback, onErrorCallback) {
        return this.service.save(data, onSuccessCallback, onErrorCallback);
    };

    return new Request();
}