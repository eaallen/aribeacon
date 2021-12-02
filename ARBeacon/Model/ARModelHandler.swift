//
//  ARModelHandler.swift
//  ARBeacon
//
//  Created by Gove Allen on 12/1/21.
//

import UIKit
import RealityKit
import Combine

class ARModelHandler {
    var modelName: String
    var modelEntity: ModelEntity?
    
    private var cancellable: AnyCancellable? = nil
    
    init(modelName: String){
        self.modelName = modelName
        
        let filename = modelName + ".usdz"
        
        self.cancellable = ModelEntity.loadModelAsync(named: filename)
            .sink(receiveCompletion: { loadCompletion in
            
            }, receiveValue: { modelEntity in
                self.modelEntity = modelEntity
            })
    }
}
