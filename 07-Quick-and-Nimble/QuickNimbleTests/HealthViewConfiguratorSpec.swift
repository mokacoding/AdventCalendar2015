//
//  QuickNimbleTests.swift
//  QuickNimbleTests
//
//  Created by Giovanni on 4/12/2015.
//  Copyright © 2015 mokacoding. All rights reserved.
//

import Quick
import Nimble

class HealthViewConfigurationSpec: QuickSpec {

    override func spec() {
        describe("HealthViewConfigurationSpec") {
            let configurator = HealthViewConfigurator()

            context("when configuring the HealthView with a Player") {
                context("when the player has full health") {
                    var player:  Player!
                    var view: HealthView!

                    beforeEach {
                        player = Player(health: 100)
                        view = HealthView()
                    }

                    it("sets the view background color to green") {
                        configurator.configureView(view, forPlayer: player)
                        expect(view.backgroundColor).to(equal(UIColor.greenColor()))
                    }
                }

                it("sets the view background color to yellow when the player has health between 15 and 39") {
                    let player = Player(health: 20)
                    let view = HealthView()

                    configurator.configureView(view, forPlayer: player)

                    expect(view.backgroundColor).to(equal(UIColor.yellowColor()))
                }

                it("sets the view background color to yellow when the player has health between 0 and 14") {
                    let player = Player(health: 13)
                    let view = HealthView()

                    configurator.configureView(view, forPlayer: player)

                    expect(view.backgroundColor).to(equal(UIColor.redColor()))
                }
            }
        }
    }
}

// MARK: -

import UIKit

struct Player {
    let health: Int
}

class HealthView: UIView { }

struct HealthViewConfigurator {

    func configureView(view: HealthView, forPlayer player: Player) {
        switch player.health {
        case 0..<15:
            view.backgroundColor = UIColor.redColor()
        case 15..<40:
            view.backgroundColor = UIColor.yellowColor()
        default:
            view.backgroundColor = UIColor.greenColor()
        }
    }
}
