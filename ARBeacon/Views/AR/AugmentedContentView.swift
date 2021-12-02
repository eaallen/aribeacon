//
//  AugmentedContentView.swift
//  ARBeacon
//
//  Created by Gove Allen on 11/16/21.
//

import SwiftUI
import RealityKit
import ARKit

struct AugmentedContentView : View {
    @State private var showModel = false
    @ObservedObject private var beaconDetector = BeaconDetector()
    var body: some View {
        
        ZStack {
            
            ARViewContainer().edgesIgnoringSafeArea(.all)
            Text(translateProximity(beaconDetector.beaconDistance))
                .font(.headline)
                .padding()
                .background(.white.opacity(0.5))
        }
    }
    
    func translateProximity(_ distance: CLProximity)->String {
        switch distance {
        case .unknown:
            return ""
        case .far:
            return "Warm"
        case .near:
            if !showModel {
                showModel = true
            }
            return "Hot"
        case .immediate:
            return "You should look behind you."
        default:
            return ""
        }
    }
}

struct ARViewContainer: UIViewRepresentable {
    
    func makeUIView(context: Context) -> ARView {
        
        let arView = ARView(frame: .zero)
        
        let config = ARWorldTrackingConfiguration()
        config.planeDetection = [.horizontal, .vertical]
        config.environmentTexturing = .automatic
        
        // not all versions of ios support this feature
        if ARWorldTrackingConfiguration.supportsSceneReconstruction(.mesh){
            config.sceneReconstruction = .mesh
        }
        
        arView.session.run(config)
        
        
        return arView
        
    }
    
    func updateUIView(_ arView: ARView, context: Context) {
        //let model = ARModelHandler(modelName: "covid19")
        
        // .loadModel is a synchronus method, will want to migrate to an async method for better rendering.
        if let modelEntity = try? ModelEntity.loadModel(named: "covid19"){
            // declare the layout of the object in the world absolutly in relation to the camera,
            var layout = matrix_identity_float4x4
            
            layout.columns.3.x = 0
            layout.columns.3.y = 0.5
            layout.columns.3.z = 2
            
            
            let anchorEntity = AnchorEntity(world: layout)
            anchorEntity.addChild(modelEntity.clone(recursive: true))
            arView.scene.addAnchor(anchorEntity)
       }else{
            // model not avaliable
            print("error loading covid19")
       }
    }
    
}

#if DEBUG
struct AugmentedContentView_Previews : PreviewProvider {
    static var previews: some View {
        AugmentedContentView()
    }
}
#endif
