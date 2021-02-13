//
//  ContentView.swift
//  UserSignatureSwiftUI
//
//  Created by Umer Khan on 13/02/2021.
//

import SwiftUI

struct SignatureView: View {
    var body: some View {
        NavigationView {
            VStack {
                Image("profile")
                    .resizable()
                    .frame(width: 256, height: 256)
                    .clipShape(Circle())
                    .shadow(radius: 10)
                    
                    .navigationBarTitle(Text("Profile"))
                
                HStack {
                    Text("Name: ")
                        .font(.title)
                        .fontWeight(.semibold)
                        .foregroundColor(.orange)
                    Spacer()
                    Text("Queen")
                        .font(.title)
                        .fontWeight(.semibold)
                        .foregroundColor(.gray)
                }
                .padding()
                
                Divider()
                
                HStack {
                    Text("Age: ")
                        .font(.title)
                        .fontWeight(.semibold)
                        .foregroundColor(.orange)
                    Spacer()
                    Text("12")
                        .font(.title)
                        .fontWeight(.semibold)
                        .foregroundColor(.gray)
                }
                .padding()
                
                Divider()
                
                HStack {
                    Text("Signature")
                        .font(.title)
                        .fontWeight(.semibold)
                        .foregroundColor(.orange)
                    Spacer()
                    
                    Image(systemName: "person.fill")
                        .resizable()
                        .frame(width: 64, height: 64)
                    
                }
                .padding()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        SignatureView()
    }
}
