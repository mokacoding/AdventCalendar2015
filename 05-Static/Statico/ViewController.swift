//
//  ViewController.swift
//  Statico
//
//  Created by Giovanni on 14/10/2015.
//  Copyright © 2015 mokacoding. All rights reserved.
//

import UIKit
import Static

class ViewController: UIViewController {

  @IBOutlet weak var tableView: UITableView!

  // How to use Static with a custom view controller
  let dataSource = DataSource()

  override func viewDidLoad() {
    super.viewDidLoad()

    title = "Static 📝"

    configureTableView()
  }

  private func configureTableView() {
    dataSource.tableView = tableView
    dataSource.sections = [
      Section(
        header: Section.Extremity.Title("title"),
        rows: [
          Row(text: "foo"),
          Row(text: "bar"),
          // How to add a selection callback
          Row(text: "tap me", selection: { self.showAlert() })
        ]
      ),
      // How to add more sections (super easy)
      Section(
        header: Section.Extremity.Title("fancy"),
        rows: [
          Row(
            accessory: .DisclosureIndicator,
            detailText: "detail text",
            text: "text",
            image: nil
          ),
          Row(text: "bar"),
        ],
        footer: Section.Extremity.Title("This is the footer")
      )
    ]
  }

  private func showAlert() {
    let alertController = UIAlertController(title: nil, message: "😜", preferredStyle: .Alert)
    let alertAction = UIAlertAction(title: "OK", style: .Default, handler: nil)
    alertController.addAction(alertAction)

    self.presentViewController(alertController, animated: true, completion: nil)
  }
  
}

