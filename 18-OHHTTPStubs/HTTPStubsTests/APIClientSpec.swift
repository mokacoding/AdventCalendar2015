//
//  JSONTests.swift
//  JSONTests
//
//  Created by Giovanni on 16/12/2015.
//  Copyright © 2015 mokacoding. All rights reserved.
//

import Quick
import Nimble
import OHHTTPStubs
@testable import HTTPStubs

class APIClientSpec: QuickSpec {

    override func spec() {
        describe("APIClient get posts") {
            let client = APIClient()

            context("when the server returns an error") {
                beforeEach {
        stub(isHost("jsonplaceholder.typecode.com")) { _ in
            return OHHTTPStubsResponse(error: NSError(domain: "test", code: 42, userInfo: [:]))
        }
                }

                afterEach {
                    OHHTTPStubs.removeAllStubs()
                }

                it("executes the completion closure with a Result.Failure with a generic error") {
                    waitUntil { done in
                        client.getPosts { result in
                            switch result {
                            case .Success(_):
                                fail("Expected a failing result")
                            case .Failure(let error):
                                switch error {
                                case let error as APIClient.Error:
                                    expect(error) == APIClient.Error.GenericError
                                case _:
                                    fail("Expected a .GenericError")
                                }
                            }
                            done()
                        }
                    }
                }
            }

            context("when the server returns a valid response") {
                beforeEach {
                    stub(isHost("jsonplaceholder.typicode.com")) { _ in
                        let posts = [
                            [
                                "id": 123,
                                "userId": 456,
                                "title": "any title",
                                "body": "any body"
                            ],
                            [
                                "id": 987,
                                "userId": 654,
                                "title": "any other title",
                                "body": "any other body"
                            ],
                        ]

                        return OHHTTPStubsResponse(
                            JSONObject: posts,
                            statusCode: 200,
                            headers: [ "ContentType": "application/json" ]
                        )

                        guard let path = OHPathForFile("success_response.json", self.dynamicType) else {
                            preconditionFailure("Could not find expected file in test bundle")
                        }

                        return OHHTTPStubsResponse(
                            fileAtPath: path,
                            statusCode: 200,
                            headers: [ "ContentType": "application/json" ]
                        )
                    }
                }

                afterEach {
                    OHHTTPStubs.removeAllStubs()
                }

                it("executes the completion closure with a Result.Success containing the posts from the response") {
                    waitUntil { done in
                        client.getPosts { result in
                            switch result {
                            case .Success(let posts):
                                expect(posts.count) == 2

                                let first = posts.first
                                expect(first?.id) == 123
                                expect(first?.userId) == 456
                                expect(first?.title) == "any title"
                                expect(first?.body) == "any body"

                                let second = posts.last
                                expect(second?.id) == 987
                                expect(second?.userId) == 654
                                expect(second?.title) == "any other title"
                                expect(second?.body) == "any other body"
                            case .Failure(_):
                                fail("Expected a successfull result")
                            }
                            done()
                        }
                    }
                }
            }
        }
    }
}