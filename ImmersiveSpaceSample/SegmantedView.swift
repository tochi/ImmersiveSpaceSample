import SwiftUI

struct SegmantedView: View {
  let viewTitles = ["Home", "Favorite"]
  @State var selectionIndex = 0

  var body: some View {
    VStack {
      Picker("", selection: $selectionIndex) {
        ForEach(0..<viewTitles.count) { index in
          Text(viewTitles[index])
            .tag(index)
        }
      }
      .pickerStyle(SegmentedPickerStyle())
      .frame(width: 1200)
      Spacer()
      if selectionIndex == 0 {
        ContentView(title: "Hello world!")
      } else {
        ContentView(title: "こんにちは")
      }
      Spacer()
    }
    .frame(width: 1280)
    .padding(EdgeInsets(top: 40, leading: 0, bottom: 40, trailing: 0))
    .glassBackgroundEffect(in: .rect(cornerRadius: 40))
  }
}

#Preview {
  SegmantedView()
}
