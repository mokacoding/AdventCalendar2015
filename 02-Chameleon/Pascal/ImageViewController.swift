//
//  ImageViewController.swift
//  Pascal
//
//  Created by Giovanni on 24/10/2015.
//  Copyright © 2015 mokacoding. All rights reserved.
//

import UIKit
import ChameleonFramework

class ImageViewController: UIViewController {

  @IBOutlet weak var topImageView: UIImageView!
  @IBOutlet weak var topColoredView: UIView!

  @IBOutlet weak var bottomImageView: UIImageView!
  @IBOutlet weak var bottomColoredView: UIView!

  override func viewDidLoad() {
    super.viewDidLoad()

    topColoredView.backgroundColor = UIColor.init(averageColorFromImage: topImageView.image, withAlpha: 1)
    bottomColoredView.backgroundColor = UIColor.init(averageColorFromImage: bottomImageView.image, withAlpha: 1)
  }
}
