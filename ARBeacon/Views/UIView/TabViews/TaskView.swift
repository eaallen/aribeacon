//
// TaskView.swift
// ARBeacon
//
// Created by Seth Erickson on 11/28/21.
//

import SwiftUI

struct TaskView: View {
    
    @ObservedObject var taskContent = ReadData()
    @State private var showAlert = false
    
    var body: some View {
        
        ZStack {
            VStack {
                VStack(spacing: 0) {

                    TopHeader(currentTab: "Tasks")
                    //          Spacer()

                }.edgesIgnoringSafeArea(.top)

                List {
                    //loop through Tasks
                    ForEach(taskContent.tasks) { task in
                        NavigationLink("\(task.taskName)", destination: MapView())
                    }

                }//.offset(x: 0, y: -50)

                HStack {
                    VStack {
                        Button("Continue") {
                            showAlert = true
                        }
                        .alert(isPresented: $showAlert) {
                            Alert(
                                title: Text("Good Job!"),
                                message: Text("Keep up the " + "good work")
                            )
                        }
                        .foregroundColor(Constants.customOrange)
                        .font(.system(size: 42))
//              .clipShape(Circle().foregroundColor(Constants.customOrange))
//              .overlay(Circle().stroke(Color.black, lineWidth: 4))

                        Text("Complete the tasks to help stop Covid-19")
                            .padding()
                            .font(.system(size: 18, weight: .bold))
                    }

                    Image("scientist")
                        .aspectRatio(contentMode: .fit)
                        .offset(x: 0, y: -50)
                }
                .offset(x: 0, y: 40)
            }
//        .position(x: 290, y: 700)
        }
    }
}

struct TaskView_Previews: PreviewProvider {

    static var previews: some View {

        TaskView(taskContent: ReadData())

    }
}


private struct Constants {
    static let tintColor: Color = .black
    static let accentColor: Color = .white
    static let customGreen: Color = Color(hex: "#1BA689")
    static let customDarkGreen: Color = Color(hex: "#326e75")
    static let customBlue: Color = Color(hex: "#41c1c0")
    static let customLightBlue: Color = Color(hex: "#d0ecef")
    static let customOrange: Color = Color(hex: "#fbcbab")
}
