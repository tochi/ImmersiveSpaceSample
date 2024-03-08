//
//  ImmersiveView.swift
//  ImmersiveSpaceSample
//
//  Created by Tomoyuki Tochihira on 2024/03/05.
//

import SwiftUI
import RealityKit
import RealityKitContent

struct ImmersiveView: View {
  @Environment(ViewModel.self) private var viewModel
  @Environment(\.openWindow) private var openWindow
  @Environment(\.dismissWindow) private var dismissWindow
 
  var body: some View {
    RealityView { content in
      // Add the initial RealityKit content
      if let immersiveContentEntity = try? await Entity(named: "Immersive", in: realityKitContentBundle) {
        content.add(immersiveContentEntity)
        
        // Add an ImageBasedLight for the immersive content
        guard let resource = try? await EnvironmentResource(named: "ImageBasedLight") else { return }
        let iblComponent = ImageBasedLightComponent(source: .single(resource), intensityExponent: 0.25)
        immersiveContentEntity.components.set(iblComponent)
        immersiveContentEntity.components.set(ImageBasedLightReceiverComponent(imageBasedLight: immersiveContentEntity))
        
        // Put skybox here.  See example in World project available at
        // https://developer.apple.com/
      }
    }
    .onAppear {
      viewModel.immersiveSpaceIsShown = true
    }
    .onDisappear {
      viewModel.immersiveSpaceIsShown = false
    }
  }
}
