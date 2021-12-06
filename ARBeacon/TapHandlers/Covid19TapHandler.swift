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
    func success (
        results: [CollisionCastHit],
        rayResult: RayResult,
        tapLocation: CGPoint,
        arGameView: ARGameView
    ){
        if let ent = results.first?.entity{
            // animate the object!
            var transform = Transform()
            transform.scale = SIMD3(0.1,0.1,0.1)
            transform.translation = ent.position
            
            ent.move(to: transform, relativeTo: ent, duration: Self.contants.shrinkDuration)
            
            DispatchQueue.main.asyncAfter(deadline: .now() + Self.contants.shrinkDuration) {
                ent.removeFromParent()
            }
        }
    }
    
    func failure(rayResult: RayResult, tapLocation: CGPoint, arGameView: ARGameView ) {
    }
    
    struct contants {
        static let shrinkDuration: TimeInterval = 1
    }
}
