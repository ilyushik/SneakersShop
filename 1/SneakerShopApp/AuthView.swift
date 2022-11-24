//
//  ContentView.swift
//  SneakerShopApp
//
//  Created by  illia on 24/11/2022.
//

import SwiftUI

struct AuthView: View {
    @State private var isTabViewShow: Bool = false
    @State private var isAuth = true
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var confirmPassword: String = ""
    var body: some View {
        ZStack {
            Image("back")
                .resizable()
                .ignoresSafeArea()
                .blur(radius: isAuth ? 2 : 6)
            VStack {
                Text(isAuth ? "Авторизация" : "Регистрация")
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
                    
                    if !isAuth {
                        SecureField("Повторите пароль", text: $confirmPassword)
                            .textFieldStyle(.roundedBorder)
                            .textContentType(.password)
                            .padding()
                    }
                }
                
                HStack {
                    Button(action: {
                        isAuth.toggle()
                    }) {
                        Text("Еще нет аккаунта")
                            .foregroundColor(.black)
                            .fontWeight(.semibold)
                            .padding(.leading, 18)
                    }
                    Spacer()
                }
                
                Button {
                    if isAuth {
                        print("Авторизация")
                        isTabViewShow.toggle()
                    } else {
                        print("Регистрация пользователя")
                        self.email = ""
                        self.password = ""
                        self.confirmPassword = ""
                        self.isAuth.toggle()
                    }
                } label: {
                    ZStack {
                        Capsule()
                            .frame(width: isAuth ? 130 : 270, height: 50)
                            .foregroundColor(.black)
                        
                        Text(isAuth ? "Войти" : "Зарегестрироваться")
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .font(.system(size: 20))
                            .padding()
                    }
                }

                
            }.padding()
            .frame(height: isAuth ? 350 : 410)
            .background(.thinMaterial)
            .cornerRadius(30)
            .padding()
        }.animation(.spring(), value: isAuth)
            .fullScreenCover(isPresented: $isTabViewShow) {
                MainTabBar()
            }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        AuthView()
    }
}
