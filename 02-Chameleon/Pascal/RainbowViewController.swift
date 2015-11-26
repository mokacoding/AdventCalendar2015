//
//  RainbowViewController.swift
//  Pascal
//
//  Created by Giovanni on 28/11/2015.
//  Copyright © 2015 mokacoding. All rights reserved.
//

import UIKit
import ChameleonFramework

class RainbowViewController: UIViewController {

  @IBOutlet var firstView: UIView!
  @IBOutlet var secondView: UIView!
  @IBOutlet var third: UIView!
  @IBOutlet var fourth: UIView!
  @IBOutlet var fifth: UIView!
  @IBOutlet var sixth: UIView!
  @IBOutlet var seventh: UIView!

  @IBOutlet var stackView: UIStackView!

  override func viewDidLoad() {
    super.viewDidLoad()

    let rainbowColors = [
      UIColor.flatRedColor(),
      UIColor.flatOrangeColor(),
      UIColor.flatYellowColor(),
      UIColor.flatGreenColor(),
      UIColor.flatSkyBlueColor(),
      UIColor.flatPurpleColor(),
      UIColor.flatBlueColor(),
    ]

    rainbowColors.enumerate().forEach { index, color in
      stackView.arrangedSubviews[index].backgroundColor = color
    }
  }
}
