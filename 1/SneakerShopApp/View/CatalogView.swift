//
//  CatalogView.swift
//  SneakerShopApp
//
//  Created by  illia on 24/11/2022.
//

import SwiftUI

struct CatalogView: View {
    
    @EnvironmentObject private var state: StateTabView
    
    let columns = [GridItem(.adaptive(minimum: UIScreen.main.bounds.width / 2.5))]
    
    var body: some View {
        NavigationView {
            ZStack {
                LinearGradient(gradient: Gradient(colors: [Color.red, Color.green]), startPoint: .topLeading, endPoint: .bottomTrailing)
                    .ignoresSafeArea()
                ScrollView(.vertical, showsIndicators: false) {
                    LazyVGrid(columns: columns,spacing: 20) {
                        ForEach(CatalogViewModel.shared.sneakers, id: \.id) { item in
                            NavigationLink {
                                let vm = SneakerDetailViewModel(sneaker: item)
                                SneakerView(viewModel: vm)
                                    .navigationBarBackButtonHidden(true)
                                    .onAppear { state.hideTabView = true }
                                            .onDisappear { state.hideTabView = false }
                            } label: {
                                ProductCell(sneaker: item)
                            }
                        }
                    }
                }
            }.navigationTitle("Каталог")
                .safeAreaInset(edge: .bottom) {
                    Rectangle()
                        .frame(height: UIScreen.main.bounds.height * 0.07)
                        .foregroundColor(.clear)
                }
        }
    }
}

struct CatalogView_Previews: PreviewProvider {
    static var previews: some View {
        CatalogView()
    }
}
