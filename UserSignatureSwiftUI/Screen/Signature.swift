////
////  Signature.swift
////  UserSignatureSwiftUI
////
////  Created by Umer Khan on 13/02/2021.
////
//
//import Foundation
////
////  SignatureView.swift
////  On-Site Invoice Manager
////
////  Created by Umer Khan on 11/02/2021.
////  Copyright © 2021 Felix Rodriguez. All rights reserved.
////
//
//import SwiftUI
//import PencilKit
//
//struct SignatureView: View {
//
//    let canvasView = PKCanvasRepresentation()
//
//    var body: some View {
//        VStack(spacing: 2) {
//            HStack {
//                Text("Signature here...")
//                Spacer()
//            }
//
//            canvasView
//                .frame(width: 256, height: 256)
//
//
//            HStack {
//                Spacer()
//                Button(action: clearTapped) {
//                    Text("Clear")
//                }
//
//                Button(action: saveTapped) {
//                    Text("Save")
//                }
//            }
//        }
//        .frame(width: UIScreen.main.bounds.width / 1.8, height: UIScreen.main.bounds.height / 1.8)
//    }
//
//    func clearTapped() {
//        canvasView.canvas.drawing = PKDrawing()
//    }
//
//    func saveTapped() {
//        let image = canvasView.canvas.drawing.image(from: CGRect(x: 0, y: 0, width: 256, height: 256), scale: 1.0)
//
//        let pngData = image.pngData()
//        UserDefaults.standard.setValue(pngData, forKey: "signature")
//        UserDefaults.standard.synchronize()
//    }
//
//    func fetchImage() {
//        let data = UserDefaults.standard.object(forKey: "signature")
//        let _ = UIImage(data: data as! Data)
//
//    }
//}
//
//struct SignatureView_Previews: PreviewProvider {
//    static var previews: some View {
//        SignatureView()
//
//    }
//}
//
//struct PKCanvasRepresentation : UIViewRepresentable {
//
//    let canvas = PKCanvasView(frame: .init(x: 0, y: 0, width: 256, height: 256))
//
//
//    func makeUIView(context: Context) -> PKCanvasView {
//        canvas.allowsFingerDrawing = true
//        canvas.backgroundColor = UIColor.gray.withAlphaComponent(0.1)
//        canvas.isOpaque = false
//        return canvas
//    }
//    func updateUIView(_ uiView: PKCanvasView, context: Context) {
//    }
//}
