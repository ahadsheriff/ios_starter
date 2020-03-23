//
//  ContentView.swift
//  starter
//
//  Created by Ahad Sheriff on 3/22/20.
//  Copyright © 2020 Ahad Sheriff. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State var show = false
    private let initialLaunchKey = "isInitialLaunch"
    
    var body: some View {
        VStack {
            if show || UserDefaults.standard.bool(forKey: initialLaunchKey){
                LoginView().transition(.move(edge: .bottom))
            } else {
                PageViewContainer( viewControllers: Page.getAll.map({  UIHostingController(rootView: PageView(page: $0) ) }), presentSignupView: {
                    withAnimation {
                        self.show = true
                    }
                    UserDefaults.standard.set(true, forKey: self.initialLaunchKey)
                }).transition(.scale)
            }
        }.frame(maxHeight: .infinity)
            .background(Color.backgroundColor)
            .edgesIgnoringSafeArea(.all)
            .onTapGesture {
                UIApplication.shared.endEditing()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
