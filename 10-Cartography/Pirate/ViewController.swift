//
//  ViewController.swift
//  Pirate
//
//  Created by Giovanni on 14/10/2015.
//  Copyright © 2015 mokacoding. All rights reserved.
//

import UIKit
import Cartography

class ViewController: UIViewController {

  let leftView = UIView()
  let halfView = UIView()

  override func viewDidLoad() {
    super.viewDidLoad()

    view.addSubview(halfView)
    halfView.backgroundColor = UIColor.purpleColor()

    view.addSubview(leftView)
    leftView.backgroundColor = UIColor.greenColor()

    constrain(self.view, halfView) { superview, view in
      view.height == superview.height / 2
      view.width  == superview.width
      view.bottom == superview.bottom
      view.left   == superview.left
    }

    /**
    constrain(self.view, leftView) { superview, view in
      view.height  == 50
      view.width   == view.height
      view.left    == superview.left
      view.centerY == superview.centerY
    }
    */

    constrain(leftView) { view in
      view.height  == 50
      view.width   == view.height
      view.left    == view.superview!.left
      view.centerY == view.superview!.centerY
    }
  }

}

