cordova.define("com.bobbytech.blinkup.blinkup", function (require, exports, module) { /*global cordova*/

    var exec = require("cordova/exec");

    var BlinkUp = function () {
    };

    BlinkUp.prototype.start = function (message, successCallback, errorCallback) {
        cordova.exec(successCallback, errorCallback, "BlinkUp", "blinkup", [message]);
    };

    module.exports = new BlinkUp();

});
