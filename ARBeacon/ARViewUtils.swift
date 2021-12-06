//
//  ARViewUtils.swift
//  ARBeacon
//
//  Created by Gove Allen on 12/4/21.
//

import Foundation
import ARKit
import RealityKit

extension ARView {
       
    func placeCube( at position: SIMD3<Float>){
        let mesh = MeshResource.generateBox(size: 0.3)
        let material = SimpleMaterial(color: .randomColor(), roughness: 0.3, isMetallic: true)
        let modelEntity = ModelEntity(mesh: mesh, materials: [material])
        modelEntity.generateCollisionShapes(recursive: true)
        
        let anchorEnt = AnchorEntity(world: position)
        anchorEnt.addChild(modelEntity)
        self.scene.addAnchor(anchorEnt)
        
    }
    
    func placeObject(named modelName: String, at position: SIMD3<Float>){
        if let modelEntity = try? ModelEntity.loadModel(named: modelName){
            // all the model entity to colide
            modelEntity.generateCollisionShapes(recursive: true)
            let anchorEntity = AnchorEntity(world: position)
            anchorEntity.addChild(modelEntity.clone(recursive: true))
            self.scene.addAnchor(anchorEntity)
            
        }
    }
    
    
}
