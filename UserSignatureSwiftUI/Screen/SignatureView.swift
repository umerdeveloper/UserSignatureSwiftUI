//
//  ContentView.swift
//  UserSignatureSwiftUI
//
//  Created by Umer Khan on 13/02/2021.
//

import SwiftUI

struct SignatureView: View {
    @State private var didTapGet: Bool = false
    @State private var signature: Image? = nil
    
    var body: some View {
        NavigationView {
            ZStack {
                Color.orange.opacity(0.1)
                    .edgesIgnoringSafeArea(.all)
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
                        
                        signature?
                            .resizable()
                            .frame(width: 100, height: 100)
                            .foregroundColor(.red)
                        
                    }
                    .padding()
                    NavigationLink(destination: DrawSignatureView(image: $signature), isActive: $didTapGet) {
                        Button(action: getSignature) {
                            VStack {
                                HStack {
                                    Spacer()
                                    Image(systemName: "scribble.variable")
                                        .resizable()
                                        .frame(width: 32, height: 32)
                                    Text("Tap to Draw")
                                        .font(.body)
                                        .fontWeight(.bold)
                                }
                                .padding()
                            }
                        }
                    }
                }
            }
        }
        .onAppear {
            fetchImage()
        }
    }
    func getSignature() {
        self.didTapGet.toggle()
    }
    
    func fetchImage() {
        if let data = UserDefaults.standard.value(forKey: "signature") {
            if let image = UIImage(data: data as! Data) {
                DispatchQueue.main.async {
                    self.signature = Image(uiImage: image)
                }
            }
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        SignatureView()
    }
}
