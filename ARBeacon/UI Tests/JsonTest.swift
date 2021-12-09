//
//  ReadJsonData.swift
//  ARBeacon
//
//  Created by Seth Erickson on 12/7/21.
//

import Foundation

class ReadTestData: ObservableObject  {
    @Published var users = [JsonTestModel]()
    
    init(){
        loadData()
    }
    
    func loadData()  {
        guard let url = Bundle.main.url(forResource: "test", withExtension: "json")
            else {
                print("Json file not found")
                return
            }
        
        let data = try? Data(contentsOf: url)
        let users = try? JSONDecoder().decode([JsonTestModel].self, from: data!)
        self.users = users!
    }
}
