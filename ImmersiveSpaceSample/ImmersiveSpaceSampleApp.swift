//
//  ImmersiveSpaceSampleApp.swift
//  ImmersiveSpaceSample
//
//  Created by Tomoyuki Tochihira on 2024/03/05.
//

import SwiftUI

@main
struct ImmersiveSpaceSampleApp: App {
  @State private var viewModel = ViewModel()
  
  var body: some Scene {
    WindowGroup(id: "Main") {
      ZStack {
        ControlPanelView()
          .environment(viewModel)
          .opacity(viewModel.immersiveSpaceIsShown ? 1 : 0)
        
//        NavigationStack {
//          ContentView(title: "Hello world !")
//            .environment(viewModel)
//        }
//        .opacity(viewModel.immersiveSpaceIsShown ? 0 : 1)
        
        TabView {
          ContentView(title: "Hello world !")
            .environment(viewModel)
            .tabItem {
              Label("English", systemImage: "list.bullet")
            }
          ContentView(title: "こんにちは世界！")
            .environment(viewModel)
            .tabItem {
              Label("Japan", systemImage: "list.bullet")
            }
        }
        .frame(width: 1280)
        .glassBackgroundEffect(in: .rect(cornerRadius: 40))
        .opacity(viewModel.immersiveSpaceIsShown ? 0 : 1)

      }
      .animation(.default, value: viewModel.immersiveSpaceIsShown)
    }
    .windowStyle(.plain)
        
    ImmersiveSpace(id: "ImmersiveSpace") {
      ImmersiveView()
        .environment(viewModel)
    }
    .immersionStyle(selection: .constant(.full), in: .full)
  }
}
