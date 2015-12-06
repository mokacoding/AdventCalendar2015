//
//  ViewController.swift
//  JSON
//
//  Created by Giovanni on 2/12/2015.
//  Copyright © 2015 mokacoding. All rights reserved.
//

import UIKit
import Alamofire

class PostsViewController: UITableViewController {

    var posts: [Post] = []
    let cellIdentifier = "post-cell"

    // MARK: - View Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "🔥 Alamofire 🔥"

        loadPosts()
    }

    // MARK: - UITableViewDataSource

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath) as UITableViewCell

        let post = posts[indexPath.row]
        cell.textLabel?.text = post.title
        cell.detailTextLabel?.text = post.body

        return cell
    }

    // MARK: - UITableViewDelegate

    // MARK: - Networking

    func loadPosts() {
        UIApplication.sharedApplication().networkActivityIndicatorVisible = true

        Alamofire.request(.GET, "http://jsonplaceholder.typicode.com/posts")
            .responseJSON { response in
                UIApplication.sharedApplication().networkActivityIndicatorVisible = false

                if let data = response.result.value as? [[String: AnyObject]] {
                    for postJSON in data {
                        if let post = Post(JSONDictionary: postJSON) {
                            self.posts.append(post)
                        }
                    }

                    dispatch_async(dispatch_get_main_queue(),{
                        self.tableView.reloadData()
                    })
                } else if let error = response.result.error {
                    print("Error: \(error)")
                }
        }
    }
}
