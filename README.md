# Cordova Plugin for the Electric Imp BlinkUp SDK v18.1.0

# Install

Checkout this repo 

    $ cordova plugin add <path>

Afterwards open xcode by 

    $ open platforms/ios/<Project Name>.xcodeproj
    
go into settings change `deployment target` to 7.0 or above and add `<Project Name>/Plugins/com.bobbytech.blinkup/Bridging-Header.h` to Objective-c Bridging Header under the Swift Compiler - Code Generation options

Add the following `LD_RUNPATH_SEARCH_PATHS = "$(inherited) @executable_path/Frameworks";`

Finally add the Electric Imp BlinkUpTM SDK framework and dependent frameworks



# Test

Add the following to index.js onDeviceReady:
```js

var success = function (result) {
    alert(result);      
}, 
fail = function (error) {
    alert("ERROR " + error);
};

/* Initial BlinkUp */
blinkup.start(‘’,success, fail);

/* Change WiFi serring */
blinkup.start(planId,success, fail);

```

License
=======

MIT
