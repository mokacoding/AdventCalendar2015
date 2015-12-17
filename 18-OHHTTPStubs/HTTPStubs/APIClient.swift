//
//  APIClient.swift
//  JSON
//
//  Created by Giovanni on 16/12/2015.
//  Copyright © 2015 mokacoding. All rights reserved.
//

import UIKit
import Foundation
import Alamofire

class APIClient {

    enum Result {
        case Success([Post])
        case Failure(ErrorType)
    }

    enum Error: ErrorType {
        // TODO: In a real app you would add more and proper error cases
        case GenericError
    }

    private let baseURLString: String

    init(baseURLString: String = "http://jsonplaceholder.typicode.com") {
        self.baseURLString = baseURLString
    }

    func getPosts(completion: (Result) -> ()) {
        UIApplication.sharedApplication().networkActivityIndicatorVisible = true
        Alamofire.request(.GET, "\(baseURLString)/posts")
            .responseJSON { response in
                UIApplication.sharedApplication().networkActivityIndicatorVisible = false

                if let data = response.result.value as? [[String: AnyObject]] {
                    let posts = data.map(Post.init).flatMap({ $0 })
                    completion(Result.Success(posts))
                } else if let _ = response.result.error {
                    completion(Result.Failure(Error.GenericError))
                }
        }
    }
}