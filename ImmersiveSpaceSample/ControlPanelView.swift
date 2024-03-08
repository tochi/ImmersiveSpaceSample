//
//  ControlPanelView.swift
//  ImmersiveSpaceSample
//
//  Created by Tomoyuki Tochihira on 2024/03/05.
//

import SwiftUI

struct ControlPanelView: View {
  @Environment(ViewModel.self) private var viewModel
  @Environment(\.dismissImmersiveSpace) var dismissImmersiveSpace
  
  var body: some View {
    VStack {
      Spacer()
      VStack {
        Button("Hidden Immersive Space") {
          viewModel.immersiveSpaceIsShown = false
          Task {
            await dismissImmersiveSpace()
          }
        }
        .padding(EdgeInsets(top: 30, leading: 0, bottom: 30, trailing: 0))
      }
      .frame(width: 400)
      .glassBackgroundEffect(in: .rect(cornerRadius: 40))
    }
  }
}

#Preview {
  ControlPanelView()
    .environment(ViewModel())
}
