//
//  ContentView.swift
//  LoginPage
//
//  Created by amasiero on 16/01/21.
//

import SwiftUI

let lightGreyColor = Color(red: 239.0/255.00, green: 243.0/255.0, blue: 244.0/255.0)

let storedUserName = "Andrey"
let storedPassword = "123"


struct ContentView: View {
    @State var userName: String = ""
    @State var password: String = ""
    
    @State var authenticationDidFail: Bool = false
    @State var authenticationDidSucceed: Bool = false
    
    var body: some View {
        //O que é ZStack e VStack
        ZStack{
            VStack{
                HelloText()
                UserImage()
                UserNameTextField(userName: $userName)
                PasswordSecureField(password: $password)
                
                if authenticationDidFail {
                    Text("Information not correct. Try again.")
                        .offset(y: -10)
                        .foregroundColor(.red)
                }
                
                Button(action: {
                    //O que é self
                    if self.userName == storedUserName && self.password == storedPassword{
                        self.authenticationDidSucceed = true
                        self.authenticationDidFail = false
                    }else{
                        self.authenticationDidFail = true
                        self.authenticationDidSucceed = false
                    }
                }){
                    LoginButtonContent()
                }
            }
                
            
            .padding()
            //Porque a mensagem foi exibida entre a imagem e os TextField
            if authenticationDidSucceed {
                Text("Login Succeeded!")
                    .font(.headline)
                    .frame(width: 250, height: 50)
                    .background(Color.yellow)
                    .cornerRadius(20.0)
                    .animation(Animation.default)
                    .padding(.bottom,20)
                    
                    
                
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct HelloText: View {
    var body: some View {
        Text("Hello you!")
            .font(.largeTitle)
            .fontWeight(.semibold)
            .padding(.bottom, 20)
    }
}

struct UserImage: View {
    var body: some View {
        Image("userImage")
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(width: 150, height: 150)
            .clipped()
            .cornerRadius(150)
            .padding(.bottom, 75)
    }
}

struct LoginButtonContent: View {
    var body: some View {
        Text("Login")
            .font(.headline)
            .foregroundColor(.white)
            .padding()
            .frame(width: 220, height: 60)
            .background(Color.black)
            .cornerRadius(35.0)
    }
}

struct UserNameTextField: View {
    
    @Binding var userName: String
    
    var body: some View {
        TextField("UserName", text: $userName)
            .padding()
            .background(lightGreyColor)
            .cornerRadius(5.0)
            .padding(.bottom, 20)
    }
}

struct PasswordSecureField: View {
    
    @Binding var password: String
    
    var body: some View {
        SecureField("Password", text: $password)
            .padding()
            .background(lightGreyColor)
            .cornerRadius(5.0)
            .padding(.bottom, 20)
    }
}
