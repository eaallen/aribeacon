//
//  TaskView.swift
//  ARBeacon
//
//  Created by Seth Erickson on 11/28/21.
//

import SwiftUI

struct TaskView: View {
    
    @ObservedObject var taskContent: TaskViewModel
    
    var body: some View {
        
        ZStack {
//            VStack(spacing: 0) {
//                    TopHeader(currentTab: "Tasks")
//                    Spacer()
//            }.edgesIgnoringSafeArea(.top)
            
            ForEach(taskContent.tasks) { task in
                Text(task.task_name)
            }
            .foregroundColor(.black)
        }
            
            

        
        
//        ForEach(appContent.cards) { card in
    }
}

struct TaskView_Previews: PreviewProvider {
    static var previews: some View {
        TaskView(taskContent: TaskViewModel())
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
        .background(Constants.headerColor)
        
    }
}

private struct Constants {
    static let headerColor: Color = Color(hex: "#1ba689")
}
