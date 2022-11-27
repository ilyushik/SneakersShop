//
//  UserInfo.swift
//  SneakerShopApp
//
//  Created by  illia on 27/11/2022.
//

import Foundation

class UserInfo: ObservableObject {
    @Published var name: String = UserDefaults.standard.string(forKey: "name") ?? "" {
        didSet {
            UserDefaults.standard.set(self.name, forKey: "name")
        }
    }
    @Published var surname: String = UserDefaults.standard.string(forKey: "surname") ?? "" {
        didSet {
            UserDefaults.standard.set(self.surname, forKey: "surname")
        }
    }
    @Published var phone: String = UserDefaults.standard.string(forKey: "phone") ?? "" {
        didSet {
            UserDefaults.standard.set(self.phone, forKey: "phone")
        }
    }
    @Published var adress: String = UserDefaults.standard.string(forKey: "adress") ?? "" {
        didSet {
            UserDefaults.standard.set(self.adress, forKey: "adress")
        }
    }
}
