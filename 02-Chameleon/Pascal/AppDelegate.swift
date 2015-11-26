//
//  AppDelegate.swift
//  Pascal
//
//  Created by Giovanni on 21/10/2015.
//  Copyright © 2015 mokacoding. All rights reserved.
//

import UIKit
import ChameleonFramework

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

  var window: UIWindow?


  func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {

    Chameleon.setGlobalThemeUsingPrimaryColor(UIColor.flatGreenColorDark(), withContentStyle: UIContentStyle.Contrast)

    return true
  }

}

