//  Copyright © 2015 mokacoding. All rights reserved.
//

import UIKit
import Alamofire

class PostsViewController: UITableViewController {

  var posts: [String] = []
  let cellIdentifier = "cell"

  // MARK: - View Lifecycle

  override func viewDidLoad() {
    super.viewDidLoad()

    title = "🔥 Alamofire 🔥"
    tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: cellIdentifier)

    loadPosts()
  }

  // MARK: - UITableViewDataSource

  override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return posts.count
  }

  override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath) as UITableViewCell

    cell.textLabel?.text = posts[indexPath.row]

    return cell
  }

  // MARK: - UITableViewDelegate

  // MARK: - Networking

  func loadPosts() {
    UIApplication.sharedApplication().networkActivityIndicatorVisible = true

    Alamofire.request(.GET, "http://jsonplaceholder.typicode.com/posts")
      .responseJSON { response in
        UIApplication.sharedApplication().networkActivityIndicatorVisible = false

        if let JSON = response.result.value as! [[String: AnyObject]]? {
          for postJSON in JSON {
            if let title = postJSON["title"] as! String? {
              self.posts.append(title)
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
