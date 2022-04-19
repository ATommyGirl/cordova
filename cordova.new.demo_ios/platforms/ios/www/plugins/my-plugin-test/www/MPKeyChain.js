cordova.define("my-plugin-test.MPKeyChain", function(require, exports, module) {
    exec = require('cordova/exec'),
    pluginloader = require('cordova/pluginloader'),
    modulemapper = require('cordova/modulemapper');
        var MPKeyChain = {
            getValueForKey: function (success, error) {
                 cordova.exec(success, error, "MPKeyChain", "getValueForKey", []);
            }
    }
    module.exports = MPKeyChain;
});
