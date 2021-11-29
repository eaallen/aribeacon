//
//  MainNavigationView.swift
//  ARBeacon
//
//  Created by Seth Erickson on 11/28/21.
//

import SwiftUI

struct MainNavigationView: View {
    var body: some View {
        TabView {
            TaskView() //change this view to the view that corresponds to the navitgation bar item
                .tabItem {
                    Label("Tasks", systemImage: "checklist")
                }

            MapView()
                .tabItem {
                    Label("Map", systemImage: "map")
                }
            
            AugmentedContentView()
                .tabItem {
                    Label("Camera", systemImage: "camera")
                }
            
            HelpView()
                .tabItem {
                    Label("Help", systemImage: "questionmark")
                }
            
            AccountView()
                .tabItem {
                    Label("Account", systemImage: "person")
                }
        }
    }
}

struct NavigationView_Previews: PreviewProvider {
    static var previews: some View {
        MainNavigationView()
    }
}

