//
//  CartView.swift
//  SneakerShopApp
//
//  Created by  illia on 24/11/2022.
//

import SwiftUI

struct CartView: View {
    var viewModel: CartViewModel
    var body: some View {
        Text("Корзина!!!")
    }
}

struct CartView_Previews: PreviewProvider {
    static var previews: some View {
        CartView(viewModel: CartViewModel())
    }
}
