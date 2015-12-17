//
//  Post.swift
//  JSON
//
//  Created by Giovanni on 2/12/2015.
//  Copyright © 2015 mokacoding. All rights reserved.
//

import Foundation
import JSONCodable

struct Post {
    let userId: Int
    let id: Int
    let title: String
    let body: String
}

extension Post {
    enum JSONKeys: String {
        case id = "id"
        case userId = "userId"
        case title = "title"
        case body = "body"
    }
}

extension Post: JSONDecodable {
    init?(JSONDictionary: JSONObject) {
        let decoder = JSONDecoder(object: JSONDictionary)
        do {
            id = try decoder.decode("id")
            userId = try decoder.decode("userId")
            title = try decoder.decode("title")
            body = try decoder.decode(Post.JSONKeys.body.rawValue)
        } catch {
            return nil
        }
    }
}

extension Post: JSONEncodable {
    func toJSON() throws -> AnyObject {
        return try JSONEncoder.create { encoder in
            try encoder.encode(id, key: "id")
            try encoder.encode(userId, key: "userId")
            try encoder.encode(title, key: "title")
            try encoder.encode(body, key: "body")
        }
    }
}
