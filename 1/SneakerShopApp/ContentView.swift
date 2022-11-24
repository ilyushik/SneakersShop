//
//  ContentView.swift
//  SneakerShopApp
//
//  Created by  illia on 24/11/2022.
//

import SwiftUI

struct ContentView: View {
    @State private var email: String = ""
    @State private var password: String = ""
    var body: some View {
        ZStack {
            Image("back")
                .resizable()
                .ignoresSafeArea()
            VStack {
                Text("Авторизация")
                    .padding()
                    .padding(.horizontal, 30)
                    .font(.title2.bold())
                    .cornerRadius(30)
                VStack(spacing: -5) {
                    TextField("Введите email", text: $email)
                        .textFieldStyle(.roundedBorder)
                        .textContentType(.emailAddress)
                        .padding()
                    SecureField("Введите пароль", text: $password)
                        .textFieldStyle(.roundedBorder)
                        .textContentType(.password)
                        .padding()
                }
                
                HStack {
                    Button(action: {
                        
                    }) {
                        Text("Еще нет аккаунта")
                            .foregroundColor(.black)
                            .fontWeight(.semibold)
                            .padding(.leading, 18)
                    }
                    Spacer()
                }
                
                Button {
                    //
                } label: {
                    ZStack {
                        Capsule()
                            .frame(width: 130, height: 50)
                            .foregroundColor(.black)
                        
                        Text("Войти")
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .font(.system(size: 20))
                            .padding()
                    }
                }

                
            }.padding()
            .frame(height: 350)
            .background(.thinMaterial)
            .cornerRadius(30)
            .padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
