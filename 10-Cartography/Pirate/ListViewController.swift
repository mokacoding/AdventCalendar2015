//
//  ListViewController.swift
//  Pirate
//
//  Created by Giovanni on 7/12/2015.
//  Copyright © 2015 mokacoding. All rights reserved.
//

import UIKit
import Cartography

class ListViewController: UIViewController {

  let tableView = UITableView()
  let button = UIButton()

  override func viewDidLoad() {
    super.viewDidLoad()

    title = "Cartography 📐"

    view.addSubview(tableView)
    view.addSubview(button)

    configureTableView()
    button.backgroundColor = UIColor.blueColor()

    addConstraints()
  }

  override func viewDidLayoutSubviews() {
    super.viewDidLayoutSubviews()

    tableView.reloadData()
  }

  private func configureTableView() {
    tableView.registerClass(Cell.self, forCellReuseIdentifier: "cell")
    tableView.separatorStyle = .None

    tableView.rowHeight = UITableViewAutomaticDimension
    tableView.estimatedRowHeight = 100

    tableView.dataSource = self
  }

  private func addConstraints() {
    constrain(tableView) { view in
      guard let superview = view.superview else {
        return
      }

      /*
      view.top == superview.topMargin
      view.bottom == superview.bottomMargin
      view.right == superview.right
      view.left == superview.left
      */
      view.edges == inset(superview.edges, 10)
    }

    constrain(button) { view in
      guard let superview = view.superview else {
        return
      }

      view.width == 40
      view.height == view.width

      view.bottom == superview.bottom - 20
      view.right == superview.right - 20
    }
  }
}

extension UIViewController: UITableViewDataSource {

  public func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 50
  }

  public func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    guard let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as? Cell else {
      fatalError("Wrong cell or no cell regitered for table view")
    }

    return cell
  }
}
