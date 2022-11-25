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
                    //if !state.hideTabView {
                        VStack {
                            Image(systemName: "menucard")
                            Text("Каталог")
                        }
                    //}
                }
            CartView(viewModel: CartViewModel())
                .tabItem {
                    //if !state.hideTabView {
                        VStack {
                            Image(systemName: "cart")
                            Text("Корзина")
                        }
                    //}
                }
            ProfileView()
                .tabItem {
                    //if !state.hideTabView {
                        VStack {
                            Image(systemName: "person")
                            Text("Профиль")
                        }
                    //}
                }
        }//.environmentObject(state)
    }
}

//extension UITabBarController {
//    override open func viewDidAppear(_ animated: Bool) {
//        super.viewDidAppear(animated)
//        let standardAppearance = UITabBarAppearance()
//
//        //standardAppearance.configureWithOpaqueBackground()
//
//        standardAppearance.configureWithTransparentBackground()
//
//
//        tabBar.standardAppearance = standardAppearance
//    }
//}


struct MainTabView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabBar()
    }
}
