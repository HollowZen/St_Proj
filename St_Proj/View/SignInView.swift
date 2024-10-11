//
//  SignIn.swift
//  St_Proj
//
//  Created by user on 10.10.2024.
//
import SwiftUI

struct SignInView: View {
    
    @State var email = ""
    @State var pass = ""
    @State private var checkBox = false
    
    var body: some View{
        VStack (alignment: .leading, spacing: 10)
        {
            
            Text("Welcome Back")
                .font(.system(size:20, weight: .bold))
            Text("Fill in your email and password to continue")
                .font(.system(size:15))
                .opacity(0.5)
            Text("")
            Text("Email Address")
                .opacity(0.5)
            TextField("*********@mail.com", text: $email)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.all, 10)
            
            Text("Password")
                .opacity(0.5)
            SecureField("*********", text: $pass)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.all, 10)
            HStack(alignment: .center)
            {
                CheckBox(value: $checkBox)
                Text("Remember password")
                    .font(.system(size:10))
                    .opacity(0.5)
                Spacer()
                Text("Forgot password?")
                    .font(.system(size:10))
                    .opacity(0.5)
            }
            Button(action:{
                
                
            }){
                VStack {
                    VStack{
                        Text("Log in")
                    }
                    .frame(minWidth: 30,maxWidth:.infinity )
                    .foregroundColor(.white)
                    .padding(10)
                    .background(Color.gray)
                    .cornerRadius(10)
                    
                    
                    
                    HStack{
                        Text("Already have an account?")
                        NavigationLink(destination: SignUpView())
                    {Text("    Sign Up")}
                    }
                
                    .opacity(0.5)
                    .font(.system(size:10))
                Text("or log in using")
                    .opacity(0.5)
                    .font(.system(size:10))
                }
            }
            
        }
        .padding(.horizontal,20)
        .navigationBarHidden(true)
    }
        
}

#Preview {
    SignInView()
}

