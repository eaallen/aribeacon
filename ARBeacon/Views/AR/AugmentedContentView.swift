//
//  AugmentedContentView.swift
//  ARBeacon
//
//  Created by Gove Allen on 11/16/21.
//

import SwiftUI
import RealityKit

struct AugmentedContentView : View {
    var body: some View {
        // tap on the camera view to see AR block!
        return ARViewContainer().edgesIgnoringSafeArea(.all)
    }
}

struct ARViewContainer: UIViewRepresentable {
    
    func makeUIView(context: Context) -> ARView {
        
        let arView = ARView(frame: .zero)
        
        // Load the "Box" scene from the "Experience" Reality File
//        let boxAnchor = try! Experience.loadBox()
        
        //let plack = try! Experience.loadScene()
        
        let rona = try! Experience.loadRona()
        
        // Add the box anchor to the scene
        arView.scene.anchors.append(rona)
        
        return arView
        
    }
    
    func updateUIView(_ uiView: ARView, context: Context) {}
    
}

#if DEBUG
struct AugmentedContentView_Previews : PreviewProvider {
    static var previews: some View {
        AugmentedContentView()
    }
}
#endif
