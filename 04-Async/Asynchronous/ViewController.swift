//
//  ViewController.swift
//  Asynchronous
//
//  Created by Giovanni on 8/11/2015.
//  Copyright © 2015 mokacoding. All rights reserved.
//

import UIKit
import Async

class ViewController: UIViewController {

  @IBOutlet var label: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()

      label.hidden = true

        // How to run code on the main thread
        Async.main {
            self.makeViewRed()
        }

        // How to run code in a backgorund thread
        Async.background {
            self.expensiveComputation()
        }

        // How to chain executions
      let target = 10000
        Async.background {
          self.count(to: target)
            }
            .main {
              self.label.hidden = false
              self.label.text = "Just finished counting to \(target) in the background 👏"
        }

        // How to cancel outstanding operations
        let block = Async.background(after: 1) {
            self.expensiveComputation()
        }

        block.cancel()
    }

    // MARK: -

    private func makeViewRed() {
        view.backgroundColor = UIColor.redColor()
    }

    private func makeViewPurple() {
        view.backgroundColor = UIColor.purpleColor()
    }

  private func expensiveComputation() {
    print("Expensive computation placeholder")
    }

  private func count(to end: Int) {
      (0..<end).forEach { i in
        print("count! \(i)")
    }
  }
}

