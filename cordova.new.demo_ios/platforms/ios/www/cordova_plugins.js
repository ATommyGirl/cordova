cordova.define('cordova/plugin_list', function(require, exports, module) {
  module.exports = [
    {
      "id": "cordova-plugin-image-picker.ImagePicker",
      "file": "plugins/cordova-plugin-image-picker/www/imagepicker.js",
      "pluginId": "cordova-plugin-image-picker",
      "clobbers": [
        "plugins.imagePicker"
      ]
    },
    {
      "id": "my-plugin-test.MPKeyChain",
      "file": "plugins/my-plugin-test/www/MPKeyChain.js",
      "pluginId": "my-plugin-test",
      "clobbers": [
        "MPKeyChain"
      ]
    }
  ];
  module.exports.metadata = {
    "cordova-plugin-whitelist": "1.3.3",
    "cordova-plugin-image-picker": "1.1.1"
  };
});
