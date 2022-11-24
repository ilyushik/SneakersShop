//
//  CatalogViewModel.swift
//  SneakerShopApp
//
//  Created by  illia on 24/11/2022.
//

import Foundation

class CatalogViewModel: ObservableObject {
    static let shared = CatalogViewModel()
    
    var sneakers = [Sneaker(id: "1", brand: "Adidas", model: "Yeezy boost 350v2", image: "yeezy", price: 365),
                    
                    Sneaker(id: "2", brand: "Adidas", model: "Deerupt", image: "deerupt", price: 110),
                    
                    Sneaker(id: "3", brand: "Adidas", model: "NMD", image: "nmd", price: 150),
                    
                    Sneaker(id: "4", brand: "Adidas", model: "Ozweego", image: "ozweego", price: 120),
                    
                    Sneaker(id: "5", brand: "Nike", model: "Air Force 1", image: "force", price: 120),
                    
                    Sneaker(id: "6", brand: "Nike", model: "Dunk Low", image: "dunk", price: 130),
                    
                    Sneaker(id: "7", brand: "Nike", model: "Air Jordan 1 Mid", image: "j1", price: 210),
                    
                    Sneaker(id: "8", brand: "Nike", model: "Air Jordan 4 retro", image: "j4", price: 340)]
}
