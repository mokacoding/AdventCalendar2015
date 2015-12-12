//
//  ViewController.swift
//  Perisomething
//
//  Created by Giovanni on 18/11/2015.
//  Copyright © 2015 mokacoding. All rights reserved.
//

import UIKit
import Prephirences

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let userDefaults = NSUserDefaults.standardUserDefaults()

        // Without Periphirences
        guard let oldSchoolValue = userDefaults.objectForKey("key") as? String else {
            print("No key found. Writing it now. Try again ;)")
            userDefaults.setValue("a value", forKey: "key")
            return
        }
        print("key = \(oldSchoolValue)")

        // With Periphirences
        guard let value = userDefaults["other_key"] else {
            print("No key found. Writing it now. Try again ;)")
            userDefaults["other_key"] = "foo"
            return
        }
        print("other_key = \(value)")

        var preferencesStore: MutablePreferencesType = NSUserDefaults.standardUserDefaults()

        guard let otherValue = preferencesStore["another_key"] else {
            print("No key found. Writing it now. Try again ;)")
            preferencesStore["another_key"] = "foo"
            return
        }
        print("another_key = \(otherValue)")
    }

}

