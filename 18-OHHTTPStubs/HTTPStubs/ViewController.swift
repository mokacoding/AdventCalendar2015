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
        APIClient().getPosts { [weak self] result in
            guard let strongSelf = self else {
                return
            }

            switch result {
            case .Success(let posts):
                dispatch_async(dispatch_get_main_queue(),{
                    strongSelf.posts = posts
                    strongSelf.tableView.reloadData()
                })
            case .Failure(let error):
                // TODO: Proper error handling
                print("Error: \(error)")
            }
        }
    }
}
