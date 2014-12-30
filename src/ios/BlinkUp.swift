//
//  BlinkUp.swift
//  Decoplant
//
//  Created by Jens-Ole Graulund on 28/12/14.
//
//

import Foundation

@objc(HWPBlinkUp) class BlinkUp : CDVPlugin, BlinkUpDelegate {
    
    var mCommand: CDVInvokedUrlCommand?
    let myBlinkUpController = BlinkUpController()
    let apiKey = "YOUR API KEY"
    var pluginResult: CDVPluginResult?
    
    func blinkup(command: CDVInvokedUrlCommand) {
        mCommand = command
        myBlinkUpController.agentUrlTimeout = 20.0
        
        var error: NSError! = myBlinkUpController.presentWifiSettingsWithDelegate(self, APIKey:apiKey, animated:true)
        
        if error != nil
        {
            pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAsString: error.description)
            commandDelegate.sendPluginResult(pluginResult, callbackId:mCommand?.callbackId)
        }
    }
    
    func blinkUp(blinkUpController: BlinkUpController!, statusVerified verifiedDate: NSDate!, agentURL: NSURL!, impeeId: NSString!, error: NSError!) {
        
        if error != nil
        {
            pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAsString: error.description)
        }
        
        if let url = agentURL?.absoluteString
        {
            pluginResult = CDVPluginResult(status: CDVCommandStatus_OK, messageAsString: url)
        }
        else
        {
            pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAsString: "No AgentUrl returned")
        }
        
        commandDelegate.sendPluginResult(pluginResult, callbackId:mCommand?.callbackId)
        
    }
    
    func blinkUp(blinkUpController: BlinkUpController!, flashCompleted flashDidComplete: Bool) {
        println("Flashing done ok")
    }
    
    func blinkUp(blinkUpController: BlinkUpController!, keyValidated apiKeyValidated: Bool, error err: NSError!) {
        println("Api Key Validated ok")
    }
    
    func blinkUpClearConfigComplete(blinkUpController: BlinkUpController!)
    {
        println("WiFi Configuration Cleared")
    }
    
    func blinkUpWillExitFromCancel(blinkUpController: BlinkUpController!)
    {
        pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAsString: "BlinkUp Cancelled")
        commandDelegate.sendPluginResult(pluginResult, callbackId:mCommand?.callbackId)
    }
}