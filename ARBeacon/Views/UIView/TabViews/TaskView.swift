//
//  TaskView.swift
//  ARBeacon
//
//  Created by Seth Erickson on 11/28/21.
//

import SwiftUI

struct TaskView: View {
    
//    @ObservedObject var appContent: AppSetupVM
    
    var body: some View {
        
        VStack(spacing: 0) {
            TopHeader(currentTab: "Tasks")
            Spacer()
        }.edgesIgnoringSafeArea(.top)
        
//        ForEach(appContent.cards) { card in
    }
}

struct TaskView_Previews: PreviewProvider {
    static var previews: some View {
        TaskView()
    }
}


struct TopHeader: View {
    
    var currentTab: String //used to pass the current tab name to the header
    
    init(currentTab: String) {
        self.currentTab = currentTab
    }
    
    var body: some View {
        
        VStack(spacing: 25){
            HStack{
                Text(currentTab)
                    .fontWeight(.bold)
                    .font(.system(size: 32))
                    .foregroundColor(.white)
                Spacer(minLength: 0)
                
//                Button(action: { // add image icons here if desired
//
//                })
//                {
//                    Image("") //insert image
//                        .resizable()
//                        .frame(width: 18, height: 18)
//                        .foregroundColor(.white)
//                }
            }
        }
        .padding(.horizontal)
        .padding(.top, 60) //replace magic number
        .background(Color("Green1"))
        
    }
}
