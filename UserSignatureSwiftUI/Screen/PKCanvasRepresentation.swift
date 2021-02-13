//
//  PKCanvasRepresentation.swift
//  UserSignatureSwiftUI
//
//  Created by Umer Khan on 13/02/2021.
//

import SwiftUI
import PencilKit

struct PKCanvasRepresentation : UIViewRepresentable {

    let canvas = PKCanvasView(frame: .init(x: 0, y: 0, width: 256, height: 256))

    func makeUIView(context: Context) -> PKCanvasView {
        canvas.allowsFingerDrawing = true
        canvas.backgroundColor = UIColor.gray.withAlphaComponent(0.1)
        canvas.isOpaque = false
        return canvas
    }
    func updateUIView(_ uiView: PKCanvasView, context: Context) {
    }
}
