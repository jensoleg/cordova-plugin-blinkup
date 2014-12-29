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
    let apiKey = "18099f3636caeea4aa4a62ab11d2698e"

    func blinkup(command: CDVInvokedUrlCommand) {
        mCommand = command
        
        var error: NSError! = myBlinkUpController.presentWifiSettingsWithDelegate(self, APIKey:apiKey, animated:true)
        
        if error != nil
        {
            var pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAsString: error.description)
            commandDelegate.sendPluginResult(pluginResult, callbackId:mCommand?.callbackId)
        }
    }

    func blinkUp(blinkUpController: BlinkUpController!, flashCompleted flashDidComplete: Bool) {
        println("Flashing done")
    }

    func blinkUp(blinkUpController: BlinkUpController!, keyValidated apiKeyValidated: Bool, error err: NSError!) {
        println("Api Key Validated")
    }

    func blinkUp(blinkUpController: BlinkUpController!, statusVerified verifiedDate: NSDate!, agentURL: NSURL!, impeeId: String!, error: NSError!) {
        if error != nil
        {
            println(error.description)

            var pluginResult = CDVPluginResult(status: CDVCommandStatus_OK, messageAsString: error.description)
            commandDelegate.sendPluginResult(pluginResult, callbackId:mCommand?.callbackId)
        }

        if let url = agentURL?.absoluteString
        {
            var pluginResult = CDVPluginResult(status: CDVCommandStatus_OK, messageAsString: url)
            commandDelegate.sendPluginResult(pluginResult, callbackId:mCommand?.callbackId)
        }
        else
        {
            println("Error - No AgentUrl returned")

            var pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAsString: error.description)
            commandDelegate.sendPluginResult(pluginResult, callbackId:mCommand?.callbackId)
        }

    }

    func blinkUpClearConfigComplete(blinkUpController: BlinkUpController!)
    {
        println("WiFi Configuration Cleared")
    }

    func blinkUpWillExitFromCancel(blinkUpController: BlinkUpController!)
    {
        println("Blinkup was Cancelled")
    }
}
