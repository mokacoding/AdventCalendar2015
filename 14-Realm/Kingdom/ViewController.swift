//
//  ViewController.swift
//  Kingdom
//
//  Created by Giovanni on 13/12/2015.
//  Copyright © 2015 mokacoding. All rights reserved.
//

import UIKit
import RealmSwift

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        var realm: Realm
        do {
            realm = try Realm()
        } catch {
            print("something went wrong")
            fatalError()
        }

        var user: User {
            if let u = realm.objects(User).first {
                return u
            } else {
                let u = User()
                u.username = "_theiostimes"

                do {
                    try realm.write {
                        realm.add(u)
                    }
                } catch {
                    fatalError()
                }

                return u
            }
        }

        do {
            let p = Post()
            p.title = "any title"
            p.body = "any body"
            p.user = user

            try realm.write {
                realm.add(p, update: true)
                user.posts.append(p)
            }
        } catch {
            print("something went wrong")
        }

        let allPosts = realm.objects(Post)
        print(allPosts)
    }
}

