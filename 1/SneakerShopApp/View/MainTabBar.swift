//
//  MainTabView.swift
//  SneakerShopApp
//
//  Created by  illia on 24/11/2022.
//

import SwiftUI

struct MainTabBar: View {
    var viewModel: MainTabBarViewModel
    @StateObject private var state = StateTabView()
    @State private var index = 0
    var body: some View {
        ZStack {
            switch index {
            case 0:
                CatalogView()
            case 1:
                CartView(viewModel: CartViewModel.shared)
            case 2:
                ProfileView()
            default:
                CatalogView()
            }
            
            VStack {
                Spacer()
                if !state.hideTabView {
                    ZStack {
                        Rectangle()
                            .frame(height: UIScreen.main.bounds.height * 0.11)
                            .foregroundStyle(.ultraThinMaterial)
                            .cornerRadius(20)
                            .padding(.bottom, UIScreen.main.bounds.height * -0.05)
                        VStack {
                            Capsule()
                                .frame(width: UIScreen.main.bounds.width * 0.2, height: UIScreen.main.bounds.height * 0.005)
                                .foregroundColor(.black)
                                .padding(.bottom)
                                .offset(x: index == 0 ? UIScreen.main.bounds.width * -0.3 : (index == 1 ? UIScreen.main.bounds.width * -0.01 : UIScreen.main.bounds.width * 0.3))
                                .animation(.spring())
                            HStack {
                                Spacer()
                                VStack {
                                    Image(systemName: "menucard")
                                    Text("Каталог")
                                }.onTapGesture {
                                    self.index = 0
                                }
                                Spacer()
                                VStack {
                                    Image(systemName: "cart")
                                    Text("Корзина")
                                }.onTapGesture {
                                    self.index = 1
                                }
                                Spacer()
                                VStack {
                                    Image(systemName: "person")
                                    Text("Профиль")
                                }.onTapGesture {
                                    self.index = 2
                                }
                                Spacer()
                            }.padding(.bottom, UIScreen.main.bounds.height * -0.01)
                        }
                    }
                }
            }
        }.environmentObject(state)
        
        
        
        
//        TabView {
//            CatalogView()
//                .tabItem {
//                    if !state.hideTabView {
//                        VStack {
//                            Image(systemName: "menucard")
//                            Text("Каталог")
//                        }
//                    }
//                }
//            CartView(viewModel: CartViewModel.shared)
//                .tabItem {
//                    if !state.hideTabView {
//                        VStack {
//                            Image(systemName: "cart")
//                            Text("Корзина")
//                        }
//                    }
//                }
//            ProfileView()
//                .tabItem {
//                    if !state.hideTabView {
//                        VStack {
//                            Image(systemName: "person")
//                            Text("Профиль")
//                        }
//                    }
//                }
//        }.environmentObject(state)
    }
}


//struct MainTabView_Previews: PreviewProvider {
//    static var previews: some View {
//       // MainTabBar(viewModel: MainTabBarViewModel(user: <#T##User#>))
//        MainTabBar()
//    }
//}
