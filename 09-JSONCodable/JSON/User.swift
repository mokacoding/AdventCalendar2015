//
//  User.swift
//  JSON
//
//  Created by Giovanni on 3/12/2015.
//  Copyright © 2015 mokacoding. All rights reserved.
//

import Foundation
import JSONCodable

struct Address {
    let street: String
    let suite: String
    let city: String
    let zipCode: String
    // TODO: Show how to decode a non standard type?
    /*
    "geo": {
    "lat": "-37.3159",
    "lng": "81.1496"
    }
    */
}

struct User {
    let id: Int
    let name: String
    let username: String
    let website: NSURL?
    let address: Address
}

// MARK: -

extension Address: JSONDecodable {
    init?(JSONDictionary: JSONObject) {
        let decoder = JSONDecoder(object: JSONDictionary)
        do {
            street = try decoder.decode("street")
            suite = try decoder.decode("suite")
            city = try decoder.decode("city")
            zipCode = try decoder.decode("zipcode")
        }
        catch {
            return nil
        }
    }
}

extension User: JSONDecodable {
    init?(JSONDictionary: JSONObject) {
        let decoder = JSONDecoder(object: JSONDictionary)
        do {
            id = try decoder.decode("id")
            name = try decoder.decode("name")
            username = try decoder.decode("username")
            website = try decoder.decode("website", transformer: JSONTransformers.StringToNSURL)
            address = try decoder.decode("address")
        } catch {
            return nil
        }
    }
}