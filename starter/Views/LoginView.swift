//
//  LoginView.swift
//  starter
//
//  Created by Ahad Sheriff on 3/22/20.
//  Copyright © 2020 Ahad Sheriff. All rights reserved.
//

import SwiftUI

struct LoginView: View {
    
    @State private var email = ""
    @State private var password = ""
    @State private var formOffset: CGFloat = 0
    @State private var presentSignupSheet = false
    @State private var presentPasswordRecoverySheet = false

    
    var body: some View {
        VStack(spacing: 40) {
            Image("Logo")
            Text("Login").font(.title).bold()
            VStack {
                LCTextfield(value: self.$email, placeholder: "Email", icon: Image(systemName: "at"), onEditingChanged: { flag in
                    withAnimation {
                        self.formOffset = flag ? -150 : 0
                    }
                })
                LCTextfield(value: self.$password, placeholder: "Password", icon: Image(systemName: "lock"), isSecure: true)
                LCButton(text: "Login") {
                    
                }
            }
            
        }.padding()
            .offset(y: self.formOffset)
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
