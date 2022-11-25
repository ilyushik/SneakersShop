//
//  PositionCell.swift
//  SneakerShopApp
//
//  Created by  illia on 25/11/2022.
//

import SwiftUI

struct PositionCell: View {
    let position: Position
    var body: some View {
        HStack {
            Image(position.sneaker.image)
                .resizable()
                .scaledToFit()
                .frame(width: 100)
            VStack(alignment: .leading) {
                Text(position.sneaker.brand)
                    .bold()
                HStack {
                    Text(position.sneaker.model)
                }
            }
            Spacer()
            VStack {
                Text("\(position.count)шт.")
                Text("\(position.cost)€")
                    .bold()
            }
            // delete func
            
        }.padding()
    }
}

struct PositionCell_Previews: PreviewProvider {
    static var previews: some View {
        PositionCell(position: Position(id: UUID().uuidString, sneaker: Sneaker(id: UUID().uuidString, brand: "Adidas", model: "Yeezy boost 350v2", image: "yeezy", price: 385), count: 1))
            .previewLayout(.sizeThatFits)
    }
}
