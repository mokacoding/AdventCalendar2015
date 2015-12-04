//  Copyright © 2015 mokacoding. All rights reserved.
//

import UIKit
import Alamofire
import PKHUD

class CreatePostViewController: UIViewController {

  @IBOutlet var cancelBarButton: UIBarButtonItem!
  @IBOutlet var saveBarButton: UIBarButtonItem!

  @IBOutlet var titleLabel: UITextField!
  @IBOutlet var bodyLabel: UITextView!

  override func viewDidLoad() {
    super.viewDidLoad()

    title = "New Post"
  }

  // MARK: Actions

  @IBAction func cancelBarButtonTouched(sender: UIBarButtonItem) {
    dismissSelf()
  }

  @IBAction func saveBarButtonTouched(sender: UIBarButtonItem) {

    PKHUD.sharedHUD.contentView = PKHUDProgressView()
    PKHUD.sharedHUD.show()

    let parameters = [
      "title": titleLabel.text ?? "",
      "body": bodyLabel.text,
      "userId": "42"
    ]

    Alamofire.request(.POST, "http://jsonplaceholder.typicode.com/posts", parameters: parameters, encoding:  .JSON)
      .validate()
      .responseJSON { [weak self] response in
        PKHUD.sharedHUD.hide()
        switch response.result {
        case .Success(let responseContent):
          self?.presentSuccessAlert(responseContent)
          break
        case .Failure(let error):
          self?.presentFailureAlert(error)
          break
        }
    }
  }

  // MARK:

  private func presentSuccessAlert(response: AnyObject) {
    if let responseDict = response as? [String: AnyObject] {
      if let id = responseDict["id"] as? Int {
        presentAlert("New post id is: \(id)")
      }
    }

    presentAlert("New post successfully created")
  }

  private func presentFailureAlert(error: ErrorType) {
    presentAlert("\(error)")
  }

  private func presentAlert(body: String) {
    let alert = UIAlertController(title: "Success", message: body, preferredStyle: .Alert)
    alert.addAction(UIAlertAction(title: "OK", style: .Default, handler: { action in
      self.dismissSelf()
      })
    )

    self.presentViewController(alert, animated: true, completion: nil)
  }

  // MARK: 

  private func dismissSelf() {
    presentingViewController?.dismissViewControllerAnimated(true, completion: nil)
  }
}
