//
//  ContentView.swift
//  St_Proj
//
//  Created by user on 07.10.2024.
//

import SwiftUI

struct SignInView: View {
    var body: some View {
        /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Hello, world!@*/Text("Hello, world!")/*@END_MENU_TOKEN@*/
    }
}


struct ContentView: View {
    @State var pass_conf = ""
    
    @State private var checkBox = false
    
    @State var isShowAlert = false
    
    @State var flag=false
    @State var flag2=false
    
    
    @StateObject var userViewModel=UserViewModel()
    
    // функция проверки правильности почты
    
    func isValidEmail(email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        
        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: email)
    }
    
    var body: some View {
        
        NavigationView() {
            
            VStack(alignment: .leading){
                NavigationLink(destination: SignIn(),
                               isActive: $userViewModel.isNavigate)
                { EmptyView() }
                VStack (alignment: .leading)
                {
                    
                    Text("Create an account")
                        .font(.system(size:20, weight: .bold))
                    Text("Complete the sign process to get started")
                        .font(.system(size:15))
                        .opacity(0.5)
                    
                }
                VStack(alignment: .leading){
                    Text("Full name")
                        .opacity(0.5)
                    TextField("Ivanov Ivan", text: $userViewModel.user.name)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding(.bottom,10)
                    
                    
                    Text("Phone number")
                        .opacity(0.5)
                    TextField("+7 (999) 999-99-99", text: $userViewModel.user.phone)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding(.bottom,10)
                    Text("Email Address")
                        .opacity(0.5)
                    TextField("*********@mail.com", text: $userViewModel.email)
                    
                        .padding(.bottom,10)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .alert(isPresented: $flag2, content: {
                            Alert(title: Text("Неверный адрес почты"),
                                  dismissButton: .default(Text("OK")))
                        })
                    
                    Text("Password")
                        .opacity(0.5)
                    SecureField("*********", text: $userViewModel.password)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    
                        .padding(.bottom,10)
                    Text("Confirm Password")
                        .opacity(0.5)
                    SecureField("*********", text: $pass_conf)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding(.bottom,10)
                }.frame(alignment: .leading)
                    .padding(.top,10)
                HStack(alignment: .center)
                {
                    CheckBox(value: $checkBox)
                        .alert(isPresented: $flag, content: {
                            Alert(title: Text("Введенные пароли не совпадают"),
                                  dismissButton: .default(Text("OK")))
                        })
                    Text("By ticking this box, you agree to our ")
                    +
                    Text("Terms and conditions and private policy")
                        .foregroundColor(.yellow)
                }
                Button(action:{
                    // условие проверки почты
                    if isValidEmail(email: userViewModel.email)==false
                    {
                        flag2=true
                    }
                    // условие проверки на совпадение паролей
                    if userViewModel.password != pass_conf
                    {
                        flag = true
                    }
                    // условие проверки на согласие с политикой конфиденциальности
                    if checkBox
                    {
                        userViewModel.signUp()
                    }
                    else
                    {
                        isShowAlert.toggle()
                    }
                    
                }){
                    VStack {
                        VStack{
                            Text("Sign Up")
                        }
                        .frame(minWidth: 30,maxWidth:.infinity )
                        .foregroundColor(.white)
                        .padding(10)
                        .background(Color.gray)
                        .cornerRadius(10)
                        .alert(isPresented: $isShowAlert) {
                            Alert(title: Text("Не стоит галочка согласия"),
                                  dismissButton: .default(Text("OK")))
                        }
                        HStack{
                            Text("Already have an account?")
                            NavigationLink(destination: SignIn())
                            {Text(" Sign in")}
                        }
                        .opacity(0.5)
                        .font(.system(size:10))
                        Text("or sign in using")
                            .opacity(0.5)
                            .font(.system(size:10))
                    }
                }
                .padding()
            }
            .padding(.horizontal,20)
            .navigationBarHidden(true)
        }.font(.custom("Roboto-Italic", size: 14))
    }
}
#Preview {
    ContentView()
}
