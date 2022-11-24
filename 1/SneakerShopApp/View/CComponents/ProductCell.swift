//
//  ProductCell.swift
//  SneakerShopApp
//
//  Created by  illia on 24/11/2022.
//

import SwiftUI

struct ProductCell: View {
    var sneaker: Sneaker
    var body: some View {
        ZStack {
            VStack(spacing: 10) {
                Image(sneaker.image)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 160, height: 120)
                VStack() {
                    HStack {
                        Text("\(sneaker.price)€")
                            .bold()
                            .foregroundColor(.black)
                        Spacer()
                    }.padding(.leading, 5)
                    HStack {
                        Text(sneaker.brand)
                            .bold()
                            .foregroundColor(.black)
                        Spacer()
                    }.padding(.leading, 5)
                    HStack {
                        Text(sneaker.model)
                            .foregroundColor(.black)
                        Spacer()
                    }.padding(.leading, 5)
                }.frame(width: 170, height: 70)
                    .background(Color("back"))
            }.frame(width: 170, height: 200)
                .background(.white)
                .clipShape(RoundedRectangle(cornerRadius: 20))
        }
    }
}

struct ProductCell_Previews: PreviewProvider {
    static var previews: some View {
        ProductCell(sneaker: Sneaker(id: "1", brand: "Adidas", model: "Yeezy boost 350v2", image: "yeezy", price: 385))
            .previewLayout(.sizeThatFits)
    }
}
