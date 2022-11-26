//
//  ProfileView.swift
//  SneakerShopApp
//
//  Created by  illia on 24/11/2022.
//

import SwiftUI

struct ProfileView: View {
    @State var isAvaAlert = false
    @State var isOut = false
    @State var isOutAlert = false
    
    var body: some View {
        VStack {
            
            HStack {
                Image("user")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 110)
                    .clipShape(Circle())
                    .onTapGesture {
                        isAvaAlert.toggle()
                    }
                    .confirmationDialog("Откуда взять фото", isPresented: $isAvaAlert) {
                        Button {
                            print("Library")
                        } label: {
                            Text("Из галереи")
                        }
                        
                        Button {
                            print("Камера")
                        } label: {
                            Text("Сделать фото")
                        }



                    }
                VStack(alignment: .leading, spacing: 10) {
                    Text("Илья Камарали")
                        .bold()
                    Text("+380 68 55 29 200")
                }
                Spacer()
            }
            
            HStack {
                VStack(alignment: .leading, spacing: 5) {
                    Text("Адрес доставки:")
                        .bold()
                    Text("Харьков, пр. Победы 68Г")
                }
                Spacer()
            }.padding(.leading)
            
            Text("Ваши заказы:")
                .bold()
                .padding(.top)
            List {
                Text("Ваши заказы буду тут")
            }.listStyle(.plain)
            
            Button {
                isOutAlert.toggle()
            } label: {
                Text("Выйти")
                    .foregroundColor(.white)
                    .padding()
                    .padding(.horizontal)
                    .frame()
                    .background(.red)
                    .cornerRadius(25)
            }.confirmationDialog("Хотите ли выйти?", isPresented: $isOutAlert) {
                Button {
                    isOut.toggle()
                } label: {
                    Text("Да")
                }

            }
            .fullScreenCover(isPresented: $isOut) {
                AuthView()
            }
            
           Spacer()
        }.fullScreenCover(isPresented: $isOut) {
            AuthView()
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
