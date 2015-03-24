function BlinkUp() {
}

BlinkUp.prototype.start = function (message, successCallback, errorCallback) {
    cordova.exec(successCallback, errorCallback, "blinkup", "blinkup", [message]);
};

BlinkUp.install = function () {
    if (!window.plugins) {
        window.plugins = {};
    }

    window.plugins.blinkup = new BlinkUp();
    console.log("blinkup installed")
    return window.plugins.blinkup;
};

cordova.addConstructor(BlinkUp.install);