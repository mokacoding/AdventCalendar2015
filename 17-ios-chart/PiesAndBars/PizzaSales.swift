//
//  PizzaSales.swift
//  PiesAndBars
//
//  Created by Giovanni on 16/12/2015.
//  Copyright © 2015 mokacoding. All rights reserved.
//

struct PizzaSale {
    let pizzaName: String
    let soldQuantity: Int
}

struct PizzaSales {
    static func sales() -> [PizzaSale] {
        return [
            PizzaSale(pizzaName: "Quattro Stagioni", soldQuantity: 60),
            PizzaSale(pizzaName: "Capricciosa", soldQuantity: 50),
            PizzaSale(pizzaName: "Margherita", soldQuantity: 80),
            PizzaSale(pizzaName: "Pepperoni", soldQuantity: 60),
            PizzaSale(pizzaName: "Marinara", soldQuantity: 30),
        ]
        
    }
}
