import SwiftUI
import RealityKit
import RealityKitContent

struct ImmersiveView: View {
  @Environment(ViewModel.self) private var viewModel
  @Environment(\.openWindow) private var openWindow
  @Environment(\.dismissWindow) private var dismissWindow
 
  var body: some View {
    RealityView { content in
      if let immersiveContentEntity = try? await Entity(named: "Immersive", in: realityKitContentBundle) {
        content.add(immersiveContentEntity)
        
        guard let resource = try? await EnvironmentResource(named: "ImageBasedLight") else { return }
        let iblComponent = ImageBasedLightComponent(source: .single(resource), intensityExponent: 0.25)
        immersiveContentEntity.components.set(iblComponent)
        immersiveContentEntity.components.set(ImageBasedLightReceiverComponent(imageBasedLight: immersiveContentEntity))
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
