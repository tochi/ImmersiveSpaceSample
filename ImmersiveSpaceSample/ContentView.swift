import SwiftUI
import RealityKit
import RealityKitContent

struct ContentView: View {
  @Environment(ViewModel.self) private var viewModel
  @Environment(\.openImmersiveSpace) var openImmersiveSpace
  @Environment(\.dismissImmersiveSpace) var dismissImmersiveSpace

  @State private var showImmersiveSpace = false
  var title: String
  
  var body: some View {
    VStack {
      Model3D(named: "Scene", bundle: realityKitContentBundle)
        .padding(.bottom, 50)
      
      Text(title)
        .padding(.bottom, 50)
      
      Button {
        Task {
          await openImmersiveSpace(id: "ImmersiveSpace")
        }
//        viewModel.immersiveSpaceIsShown = !viewModel.immersiveSpaceIsShown
      } label: {
        Text("Show Immersive Space")
      }
    }
    .padding()
  }
}

#Preview(windowStyle: .automatic) {
  ContentView(title: "Hello world !")
    .environment(ViewModel())
}
