//
//  CartViewModel.swift
//  SneakerShopApp
//
//  Created by  illia on 25/11/2022.
//

import Foundation

class CartViewModel: ObservableObject {
    @Published var positions = []
    
    func addPosition(position: Position) {
        self.positions.append(position)
    }
}
