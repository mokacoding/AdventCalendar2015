//
//  ViewController.swift
//  Permission
//
//  Created by Giovanni on 12/11/2015.
//  Copyright © 2015 mokacoding. All rights reserved.
//

import UIKit
import PermissionScope

class ViewController: UIViewController {

    @IBOutlet var permissionSwitch: UISwitch!

    override func viewDidLoad() {
        super.viewDidLoad()

        presentSimplePermissionsAlert()
    }

    func presentSimplePermissionsAlert() {
        let permissionScope = PermissionScope()

        // Set up permissions
        permissionScope.addPermission(ContactsPermission(),
            message: "This way it is going to be easier to find your friends"
        )
        permissionScope.addPermission(NotificationsPermission(notificationCategories: nil),
            message: "So that we can send you the latests updates straightaway"
        )

        // Show permission dialog with callbacks
        permissionScope.show(
            { finished, results in
                print("Permissions state changed, results: \(results)")
            },
            cancelled: { results in
                print("User closed the permission alert, results: \(results)")
            }
        )
    }

    // MARK: Actions

    @IBAction func presentLocationPermissionAlert() {
        let pscope = PermissionScope()
        
        pscope.addPermission(LocationWhileInUsePermission(),
            message: "We use this to show you good coffee places near you")

        pscope.show({ finished, results in
            print("got results \(results)")
            }, cancelled:  { reulsts in
                print("location permission was cancelled")
        })
    }

    @IBAction func onSwitchChange(sender: UISwitch) {
        if sender.on {
            // turn on photos access
            if PermissionScope().statusPhotos() == .Authorized {
                print("Photos have been already authorized")
            } else {
                print("Photos need to be reauthorized")
                PermissionScope().requestPhotos()
            }
        } else {
            // turn off photos access
        }
    }
}

