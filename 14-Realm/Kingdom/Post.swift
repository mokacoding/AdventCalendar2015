//
//  Post.swift
//  Kingdom
//
//  Created by Giovanni on 13/12/2015.
//  Copyright © 2015 mokacoding. All rights reserved.
//

import Foundation
import RealmSwift

class Post: Object {
    dynamic var id: String = NSUUID().UUIDString
    dynamic var user: User?
    dynamic var title: String = ""
    dynamic var body: String = ""

    override static func primaryKey() -> String? {
        return "id"
    }
}
