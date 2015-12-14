//
//  ViewController.swift
//  Galileo
//
//  Created by Giovanni on 24/10/2015.
//  Copyright © 2015 mokacoding. All rights reserved.
//

import UIKit
import Eureka

class ViewController: FormViewController  {

  override func viewDidLoad() {
    super.viewDidLoad()

    addLoginForm(toForm: form)
    addMultipleChoicesForm(toForm: form)
    addFormWithToggle(toForm: form)
  }

  private func addLoginForm(toForm form: Form) {
    form +++ Section("Login Form")
      <<< TextRow() { $0.placeholder = "Username" }
      <<< PasswordRow() { $0.placeholder = "Password" }
      <<< ButtonRow() {
        $0.title = "Login"
        $0.onCellSelection { cell, row in
          self.presentAlert(message: "Will login")
        }
    }
  }

  private func addMultipleChoicesForm(toForm form: Form) {
    form +++ Section("Multiple Choices")
      <<< MultipleSelectorRow<String>() {
        $0.title = "Favourite Foods"
        $0.options = ["🍝", "🍟", "🍕", "🍚"]
        $0.value = ["🍝", "🍕" ]
    }
  }

  private func addFormWithToggle(toForm form: Form) {
    let switchRowTag = "switch_row"
    let setStartDateRowTag = "set_start_date_time"
    let setEndDateRowTag = "set_end_date_time"

    let switchRow = SwitchRow(switchRowTag) {
      $0.title = "All Day Event"
      $0.value = true
    }

    let hiddenCondition = Condition.Function([switchRowTag]) { form in
      guard let switchCell = form.rowByTag(switchRowTag) as? SwitchRow else {
        return false
      }

      return switchCell.value == true
    }

    let s = Section()
    s.append(switchRow)
    s.append(DateTimeInlineRow(setStartDateRowTag) {
      $0.title = "Starts"
      $0.value =  NSDate.oneHourFromNow()
      $0.hidden = hiddenCondition
      })
    s.append(DateTimeInlineRow(setEndDateRowTag) {
      $0.title = "Ends"
      $0.value =  NSDate.hoursFormNow(4)
      $0.hidden = hiddenCondition
      })
    form.append(s)
  }

  private func presentAlert(title: String? = nil, message: String) {
    let alertController = UIAlertController(title: title, message: message, preferredStyle: .Alert)
    alertController.addAction(UIAlertAction(title: "OK", style: .Default, handler: nil))
    self.presentViewController(alertController, animated: true, completion: nil)
  }

}

// MARK:

extension NSDate {

  static func oneHourFromNow() -> NSDate {
    return NSDate.hoursFormNow(1)
  }

  static func hoursFormNow(numberOfHours: Int) -> NSDate {
    let interval = Double(numberOfHours) * 60
    return NSDate().dateByAddingTimeInterval(interval)
  }

}