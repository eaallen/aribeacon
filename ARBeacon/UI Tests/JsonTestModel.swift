//
//  JsonTestModel.swift
//  ARBeacon
//
//  Created by Seth Erickson on 12/7/21.
//

import Foundation

struct JsonTestModel: Codable, Identifiable {
    enum CodingKeys: CodingKey {
        case name
        case designation
        case email
        case description
    }
        
    var id = UUID()
    var name: String
    var designation: String
    var email: String
    var description: String
}
