//
//  HQView.swift
//  ARBeacon
//
//  Created by Gove Allen on 11/16/21.
//

import SwiftUI
import RealityKit
import ARKit

struct HQView : View {
    @State var objectIsPlaced = false
    var body: some View {
        ZStack {
            ARViewContainer(objectIsPlaced: $objectIsPlaced)
                .edgesIgnoringSafeArea(.all)
                .onAppear(){
                    
                }
            
        }
    }
    
    /// view for handling AR content! this connects UIKit to SwiftUI
    struct ARViewContainer: UIViewRepresentable {
        @Binding var objectIsPlaced: Bool
        private let modelName = "NeonXStickAni"
        func makeUIView(context: Context) -> ARGameView {
            let arView = ARGameView.loadAndConfigure(tapHandler: DefaultTapHandler())
            
            var layout = SIMD3<Float>()
            layout.x = 0
            layout.y = 0.5
            layout.z = -3
            arView.placeObject(named: modelName, at: layout)
            
            return arView
        }
        
        func updateUIView(_ arView: ARGameView, context: Context) {
        
        }
        
        
        
    }
}


