//
//  User.swift
//  Kingdom
//
//  Created by Giovanni on 14/12/2015.
//  Copyright © 2015 mokacoding. All rights reserved.
//

import Foundation
import RealmSwift

class User: Object {
    dynamic var id = NSUUID().UUIDString
    dynamic var username = ""

    let posts = List<Post>()
}
