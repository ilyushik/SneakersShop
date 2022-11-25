//
//  SneakerView.swift
//  SneakerShopApp
//
//  Created by  illia on 24/11/2022.
//

import SwiftUI

struct SneakerView: View {
    @Environment(\.presentationMode) var presentationMode
    @State var size = "40"
    @State var count = 1
    var viewModel: SneakerDetailViewModel
    var body: some View {
        NavigationView {
            VStack(spacing: 0) {
                VStack {
                    Image(viewModel.sneaker.image)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 350)
                }.frame(width: .infinity, height: UIScreen.main.bounds.height * 0.4)
                VStack {
                    VStack {
                        HStack {
                            Text(viewModel.sneaker.brand)
                                .bold()
                            .font(.system(size: 50))
                            Spacer()
                        }.padding(.leading)
                        HStack {
                            Text(viewModel.sneaker.model)
                                .font(.system(size: 40))
                            Spacer()
                        }.padding(.leading)
                        HStack {
                            Text("\(viewModel.getPrice(size: size))€")
                                .font(.system(size: 40))
                                .fontWeight(.semibold)
                            Spacer()
                        }.padding(.leading)
                    }.padding(.top)
                    
                    HStack {
                        Text("Размер:")
                            .font(.system(size: 20))
                        Spacer()
                        Picker("Size", selection: $size) {
                            ForEach(viewModel.sizes, id: \.self) { item in
                                Text(item)
                            }
                        }.pickerStyle(.menu)
                    }.padding(.horizontal)
                        .padding(.top, -25)
                    
                    HStack {
                        Stepper("Колличество", value: $count, in: 1...10)
                            Text("\(count)")
                            .padding(.leading)
                    }.padding(.horizontal)
                    
                    HStack {
                        Text("Цена:")
                        Spacer()
                        Text("\(viewModel.getPrice(size: size) * count)€")
                            .bold()
                    }.padding(.horizontal)
                        .padding(.top)
                    
                    Button {
                        var position = Position(id: UUID().uuidString,
                                                sneaker: viewModel.sneaker,
                                                count: self.count)
                        position.sneaker.price = viewModel.getPrice(size: size)
                        
                        CartViewModel.shared.addPosition(position)
                        presentationMode.wrappedValue.dismiss()
                        
                    } label: {
                        ZStack {
                            Capsule()
                                .frame(width: 200, height: 60)
                                .foregroundColor(.black)
                            Text("Добавить в корзину")
                                .foregroundColor(.white)
                                .fontWeight(.semibold)
                        }.padding(.top, 35)
                    }

                    
                    
                    Spacer()
                }.frame(width: UIScreen.main.bounds.width * 1.0, height: UIScreen.main.bounds.height * 0.6)
                    .background(Color("back"))
                    .cornerRadius(40)
                    .shadow(color: .black .opacity(0.4), radius: 8, y: -5)
            }.toolbar {
                    ToolbarItem(placement: .navigationBarLeading) {
                        Button {
                            presentationMode.wrappedValue.dismiss()
                        } label: {
                            Image(systemName: "arrow.left")
                                .foregroundColor(.black)
                        }

                    }
                }
        }
    }
}

struct SneakerView_Previews: PreviewProvider {
    static var previews: some View {
        SneakerView(viewModel: SneakerDetailViewModel(sneaker: Sneaker(id: "1", brand: "Adidas", model: "Yeezy boost 350v2", image: "yeezy", price: 385)))
    }
}
