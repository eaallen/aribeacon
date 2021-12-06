//
//  Covid19TapHandler.swift
//  ARBeacon
//
//  Created by Gove Allen on 12/6/21.
//

import Foundation
import RealityKit
import ARKit

struct Covid19TapHandler : ARModelOnTapHandler {
    func success(results: [CollisionCastHit], rayResult: RayResult, tapLocation: CGPoint, arGameView: ARGameView ) {
        results.first?.entity.removeFromParent()
    }
    
    func failure(rayResult: RayResult, tapLocation: CGPoint, arGameView: ARGameView ) {
        let results = arGameView.raycast(from: tapLocation, allowing: .estimatedPlane, alignment: .any)
        
        if let firstResult = results.first {
            let position = simd_make_float3(firstResult.worldTransform.columns.3)
            arGameView.placeObject(named: "covid19", at: position)
        }
    }
    
    
}
