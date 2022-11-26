//
//  MainTabView.swift
//  SneakerShopApp
//
//  Created by  illia on 24/11/2022.
//

import SwiftUI

struct MainTabBar: View {
    @StateObject private var state = StateTabView()
    var body: some View {
        TabView {
            CatalogView()
                .tabItem {
                    if !state.hideTabView {
                        VStack {
                            Image(systemName: "menucard")
                            Text("Каталог")
                        }
                    }
                }
            CartView(viewModel: CartViewModel.shared)
                .tabItem {
                    if !state.hideTabView {
                        VStack {
                            Image(systemName: "cart")
                            Text("Корзина")
                        }
                    }
                }
            ProfileView()
                .tabItem {
                    if !state.hideTabView {
                        VStack {
                            Image(systemName: "person")
                            Text("Профиль")
                        }
                    }
                }
        }.environmentObject(state)
    }
}


struct MainTabView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabBar()
    }
}
