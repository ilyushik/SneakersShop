//
//  CartView.swift
//  SneakerShopApp
//
//  Created by  illia on 24/11/2022.
//

import SwiftUI

struct CartView: View {
   @StateObject var viewModel: CartViewModel
    var body: some View {
        NavigationView {
            VStack {
                List(viewModel.positions) { position in
                    PositionCell(position: position)
                        .swipeActions {
                            Button {
                                viewModel.positions.removeAll()
                            } label: {
                                Label("Удалить", systemImage: "trash")
                            }.tint(.red)
                            
                        }
                }.listStyle(.plain)
                
                
                HStack {
                    Text("Всего:")
                        .bold()
                    Spacer()
                    Text("\(self.viewModel.cost)€")
                        .bold()
                }.padding()
                
                HStack {
                    Button {
                        print("Cancel")
                    } label: {
                        Text("Отменить")
                            .font(.body)
                            .bold()
                            .foregroundColor(.white)
                            .padding()
                            .frame()
                            .background(.red)
                            .cornerRadius(30)
                    }
                    Spacer()
                    Button {
                        print("To order")
                    } label: {
                        Text("Заказать")
                            .font(.body)
                            .bold()
                            .foregroundColor(.white)
                            .padding()
                            .frame()
                            .background(.green)
                            .cornerRadius(30)
                    }
                    
                }.padding(.horizontal)
            }.padding(.bottom)
                .navigationTitle("Корзина")
        }
    }
}

struct CartView_Previews: PreviewProvider {
    static var previews: some View {
        CartView(viewModel: CartViewModel.shared)
    }
}
