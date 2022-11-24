//
//  SneakerView.swift
//  SneakerShopApp
//
//  Created by  illia on 24/11/2022.
//

import SwiftUI

struct SneakerView: View {
    var sneaker: Sneaker
    var body: some View {
        VStack(spacing: 0) {
            VStack {
                Image(sneaker.image)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 350)
            }.frame(width: .infinity, height: UIScreen.main.bounds.height * 0.4)
            VStack {
                VStack {
                    HStack {
                        Text(sneaker.brand)
                            .bold()
                        .font(.system(size: 50))
                        Spacer()
                    }.padding(.leading)
                    HStack {
                        Text(sneaker.model)
                            .font(.system(size: 40))
                        Spacer()
                    }.padding(.leading)
                    HStack {
                        Text("\(sneaker.price)€")
                            .font(.system(size: 40))
                            .fontWeight(.semibold)
                        Spacer()
                    }.padding(.leading)
                }.padding(.top)
                
                
                Spacer()
            }.frame(width: UIScreen.main.bounds.width * 1.0, height: UIScreen.main.bounds.height * 0.6)
                .background(Color("back"))
                .cornerRadius(40)
        }
    }
}

struct SneakerView_Previews: PreviewProvider {
    static var previews: some View {
        SneakerView(sneaker: Sneaker(id: "1", brand: "Adidas", model: "Yeezy boost 350v2", image: "yeezy", price: 385))
    }
}
