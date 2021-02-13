//
//  DrawSignatureView.swift
//  UserSignatureSwiftUI
//
//  Created by Umer Khan on 13/02/2021.
//

import SwiftUI
import PencilKit

struct DrawSignatureView: View {
    
    @Binding var image: Image?
    @Environment(\.presentationMode) var presentationMode
    
    let canvasView = PKCanvasRepresentation()

    var body: some View {
        VStack(spacing: 2) {
            HStack {
                Text("Signature here...")
                Spacer()
            }

            canvasView
                .frame(width: 256, height: 256)
                .cornerRadius(12)


            HStack {
                Spacer()
                Button(action: clearTapped) {
                    Text("Clear")
                }

                Button(action: saveTapped) {
                    Text("Save")
                }
            }
        }
        .frame(width: UIScreen.main.bounds.width / 1.8, height: UIScreen.main.bounds.height / 1.8)
    }

    func clearTapped() {
        canvasView.canvas.drawing = PKDrawing()
    }

    func saveTapped() {
        let image = canvasView.canvas.drawing.image(from: CGRect(x: 0, y: 0, width: 256, height: 256), scale: 1.0)
        
        DispatchQueue.main.async {
            self.image = Image(uiImage: image)
        }
        
        //TODO: - Can persist Image
        let pngData = image.pngData()
        UserDefaults.standard.setValue(pngData, forKey: "signature")
        UserDefaults.standard.synchronize()
        
        presentationMode.wrappedValue.dismiss()
    }

    func fetchImage() {
        let data = UserDefaults.standard.object(forKey: "signature")
        let _ = UIImage(data: data as! Data)
    }
}

struct DrawSignatureView_Previews: PreviewProvider {
    static var previews: some View {
        DrawSignatureView(image: .constant(Image("profile")))
    }
}
