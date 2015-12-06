//
//  CoolNimbleMatchers.swift
//  QuickNimble
//
//  Created by Giovanni on 4/12/2015.
//  Copyright © 2015 mokacoding. All rights reserved.
//

import Quick
import Nimble

class CoolNimbleMatchersDemo: QuickSpec {

    override func spec() {
        describe("Nimble matchers") {
            it("are pretty cool") {
                let anInt = 42
                let aString = "lol"

                expect(anInt) == 42
                expect(anInt) != 34

                expect(aString) == "Merry Christmas"

                let foo = FooClass()

                expect{ try FooClass().somethingThatThrows()  }.to(throwError())

                expect(foo.barValue).toEventually(equal(42))

                waitUntil { done in
                    // some async code with callback closure
                    done()
                }
            }
        }
    }
}

class FooClass {
    var barValue: Int = 42

    func somethingThatThrows() throws { }
}