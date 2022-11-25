//
//  Position.swift
//  SneakerShopApp
//
//  Created by  illia on 25/11/2022.
//

import Foundation

struct Position: Identifiable {
    var id: String
    var sneaker: Sneaker
    var count: Int
    
    var cost: Int {
        return sneaker.price * count
    }
}
