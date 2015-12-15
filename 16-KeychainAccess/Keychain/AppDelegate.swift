//
//  AppDelegate.swift
//  Keychain
//
//  Created by Giovanni on 15/12/2015.
//  Copyright © 2015 mokacoding. All rights reserved.
//

import UIKit
import KeychainAccess

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {

        // Get a Keychain interface
        //
        let keychain = Keychain(service: "com.theiostimes.keychain_example")

        // Basic read, write, remove
        //
        do {
            try keychain.set("1234-5678-90AB", key: "token")
        } catch {
            // TODO: Handle write failure
        }

        do {
            let _ = try keychain.get("token")
        } catch {
            // TODO: Handle read failure
        }

        do {
            try keychain.remove("token")
            try keychain.removeAll()
        } catch {
            // TODO: Handle delete failure
        }


        // Subscript is available too
        //
        keychain["mozzarella"] = "123-456"
        let _ = keychain["mozzarella"]

        // You can configure the Keychain instance like this
        //
        let _ = Keychain(service: "com.theiostimes.keychainexample")
            .label("theiostimes.com (mokagio)")
            .synchronizable(true)
            .accessibility(.AfterFirstUnlock)

        // How to Touch ID
        //
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)) {
            do {
                // Should be the secret invalidated when passcode is removed? If not then use `.WhenUnlocked`
                try keychain
                    .accessibility(.WhenPasscodeSetThisDeviceOnly, authenticationPolicy: .UserPresence)
                    .authenticationPrompt("Authenticate to update your access token")
                    .set("01234567-89ab-cdef-0123-456789abcdef", key: "token")
            } catch {
                // Error handling if needed...
            }
        }
        
        return true
    }
}