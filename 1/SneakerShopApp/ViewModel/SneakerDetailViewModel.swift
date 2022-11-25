//
//  ProductDetailViewModel.swift
//  SneakerShopApp
//
//  Created by  illia on 25/11/2022.
//

import Foundation

class SneakerDetailViewModel: ObservableObject {
    @Published var sneaker: Sneaker
    @Published var sizes = ["40", "41", "42", "43", "44", "45", "46"]
    @Published var count = 1
    
    init(sneaker: Sneaker) {
        self.sneaker = sneaker
    }
    
    func getPrice(size: String) -> Int {
        switch size {
        case "40":
            return Int(Double(sneaker.price))
        case "41":
            return Int(Double(sneaker.price) * 1.05)
        case "42":
            return Int(Double(sneaker.price) * 1.1)
        case "43":
            return Int(Double(sneaker.price) * 1.15)
        case "44":
            return Int(Double(sneaker.price) * 1.2)
        case "45":
            return Int(Double(sneaker.price) * 1.25)
        case "46":
            return Int(Double(sneaker.price) * 1.3)
        default:
            return Int(Double(sneaker.price))
        }
    }
}
