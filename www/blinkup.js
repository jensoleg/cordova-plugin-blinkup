/*global cordova*/

var exec = require("cordova/exec");

var BlinkUp = function(){};

BlinkUp.prototype.start = function (successCallback, errorCallback) {
    cordova.exec(successCallback, errorCallback, "BlinkUp", "blinkup");
};

module.exports = new BlinkUp();
