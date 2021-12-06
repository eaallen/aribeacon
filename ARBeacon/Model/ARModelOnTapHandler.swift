//
//  ARModelOnTapHandler.swift
//  ARBeacon
//
//  Created by Gove Allen on 12/6/21.
//

import Foundation
import RealityKit
import ARKit
protocol ARModelOnTapHandler {
    typealias RayResult = (origin: SIMD3<Float>, direction: SIMD3<Float>)
    
    func success(results: [CollisionCastHit], rayResult: RayResult, tapLocation: CGPoint, arGameView: ARGameView ) -> Void
    
    func failure(rayResult: RayResult, tapLocation: CGPoint, arGameView: ARGameView ) -> Void
}


class ARGameView : ARView {
    var tapHanlder: ARModelOnTapHandler
    
    required init(frame: CGRect, tapHandler: ARModelOnTapHandler){
        self.tapHanlder = tapHandler
        
        super.init(frame: frame)
    }
    
    required init(frame: CGRect, cameraMode: ARView.CameraMode, automaticallyConfigureSession: Bool, tapHandler: ARModelOnTapHandler){
        self.tapHanlder = tapHandler
        
        super.init(frame: frame, cameraMode: cameraMode, automaticallyConfigureSession: automaticallyConfigureSession)
    }
    
    required init?(coder: NSCoder){
        tapHanlder = DefaultTapHandler()
        super.init(coder: coder)
    }
    
    @MainActor @objc required dynamic init(frame frameRect: CGRect) {
        fatalError("init(frame:) has not been implemented")
    }
    
    func enableTapGesture(){
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(handleTap(recognizer:)))
        self.addGestureRecognizer(tapGestureRecognizer)
    }
    
    /// The method that gets called when the user taps on the screen
    @objc func handleTap(recognizer: UITapGestureRecognizer){
        let tapLocation = recognizer.location(in: self)
        
        guard let rayResult = self.ray(through: tapLocation) else {return}
        
        let results = self.scene.raycast(origin: rayResult.origin, direction: rayResult.direction)
        
        if let _ = results.first {
            // we found the ar object with a raycast intersection
            tapHanlder.success(results: results, rayResult: rayResult, tapLocation: tapLocation, arGameView: self)
        
        } else {
            // raycast did not find anything!
            // this will let us place objects in the game
            tapHanlder.failure(rayResult: rayResult, tapLocation: tapLocation, arGameView: self)
            
            
        }
    }
    
    
    
}


struct DefaultTapHandler : ARModelOnTapHandler{
    func success(results: [CollisionCastHit], rayResult: RayResult, tapLocation: CGPoint, arGameView: ARGameView ) {}
    
    func failure(rayResult: RayResult, tapLocation: CGPoint, arGameView: ARGameView ) {}
}
