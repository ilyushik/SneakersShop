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
    @State private var isShowAlert = false
    @State private var alertMessage = ""
    @ObservedObject var userInfo = UserInfo()
    
    
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
                        TextField("Введите имя", text: $userInfo.name)
                            .textFieldStyle(.roundedBorder)
                            .textContentType(.name)
                            .padding()
                        TextField("Введите фамилию", text: $userInfo.surname)
                            .textFieldStyle(.roundedBorder)
                            .textContentType(.username)
                            .padding()
                        TextField("Введите телефон", text: $userInfo.phone)
                            .textFieldStyle(.roundedBorder)
                            .textContentType(.telephoneNumber)
                            .padding()
                        TextField("Введите адресс", text: $userInfo.adress)
                            .textFieldStyle(.roundedBorder)
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
                        //self.isTabViewShow.toggle()
                        
                        
                        AuthService.shared.SignIn(email: self.email, password: self.password) { result in
                            switch result {
                            case .success(_ ):
                                isTabViewShow.toggle()
                            case .failure(let error):
                                alertMessage = "Ошибка авторизации: \(error.localizedDescription)"
                                self.isShowAlert.toggle()
                            }
                        }
                    } else {
                       
                        
                        
                        print("Регистрация пользователя")
                        
                        guard password == confirmPassword else {
                            self.alertMessage = "Пароли не совпадают"
                            self.isShowAlert.toggle()
                            return
                        }
                        
                        AuthService.shared.signUp(email: self.email, password: self.password) { result in
                            switch result {
                            case .success(let user):
                                alertMessage = "Вы зарегестрировались с \(user.email!)"
                                self.isShowAlert.toggle()
                                self.email = ""
                                self.password = ""
                                self.confirmPassword = ""
                                self.isAuth.toggle()
                            case .failure(let error):
                                alertMessage = "Ошибка регестрации: \(error.localizedDescription)"
                                self.isShowAlert.toggle()
                            }
                        }
                        
                        
                        
                        
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
            .frame(height: isAuth ? 350 : 650)
            .background(.thinMaterial)
            .cornerRadius(30)
            .padding()
        }.animation(.spring(), value: isAuth)
            .fullScreenCover(isPresented: $isTabViewShow) {
                
                let mainTabBarViewModel = MainTabBarViewModel(user: AuthService.shared.currentUser!)
                MainTabBar(viewModel: mainTabBarViewModel)
            }
            .alert(alertMessage, isPresented: $isShowAlert) {
                Button {
                    
                } label: {
                    Text("OK")
                }

            }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        AuthView()
    }
}
