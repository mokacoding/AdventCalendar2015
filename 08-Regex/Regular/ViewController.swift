//
//  ViewController.swift
//  Regular
//
//  Created by Giovanni on 16/11/2015.
//  Copyright © 2015 mokacoding. All rights reserved.
//

import UIKit
import Regex

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let input = "poo"

        let banned = ["poo", "poop", "dang"]
        let bannedRegex = "(\(banned.joinWithSeparator("|")))+"

        if Regex(bannedRegex).matches(input) {
            print("Sorry you cannot use banned words")
        }

        let dirtyString = "dang! there is a lot of poo in this place"
        Regex(bannedRegex).match(dirtyString)?.captures.forEach { captured in
            print("Sorry the word \(captured) is not allowed")
        }
    }

}

