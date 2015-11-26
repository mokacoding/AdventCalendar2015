//  Copyright © 2015 mokacoding. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

  var window: UIWindow?


  func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
    setApparence()
    return true
  }

  private func setApparence() {
    window?.tintColor = mainTintColor
    UINavigationBar.appearance().tintColor = mainTintColor
    UIButton.appearance().tintColor = mainTintColor
  }

  private let mainTintColor = UIColor.orangeColor()
}
