//
//  MainTabBarViewModel.swift
//  SneakerShopApp
//
//  Created by  illia on 27/11/2022.
//

import Foundation
import FirebaseAuth

class MainTabBarViewModel: ObservableObject {
    
    @Published var user: User
    
    init(user: User) {
        self.user = user
    }
}
