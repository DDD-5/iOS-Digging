//
//  StoredDiggingListView.swift
//  Digging
//
//  Created by 황재욱 on 2021/04/07.
//

import SwiftUI

struct StoredDiggingListView: View {
  
  // MARK: - Properties
  
  @GestureState private var dragOffset = CGSize.zero

  
  @State var selection: SelectedType = .total
  
  // MARK: - Layout
  
  var body: some View {
    VStack(alignment: .leading) {
      DiggingListNavigationBar()
      UpperTabBarView(selection: $selection)
      LazyVGrid(columns: [
        GridItem(.adaptive(minimum: 120, maximum: 160), spacing: 20)
      ], content: {
        DiggingGridCellView().frame(height: 160)
        DiggingGridCellView().frame(height: 160)
      })
      Spacer()
    }
    .navigationBarHidden(true)
  }
}

struct StoredDiggingListView_Previews: PreviewProvider {
  static var previews: some View {
    StoredDiggingListView()
  }
}


extension View {
  public func currentDeviceNavigationViewStyle() -> AnyView {
    if UIDevice.current.userInterfaceIdiom == .pad {
      return AnyView(self.navigationViewStyle(DefaultNavigationViewStyle()))
    } else {
      return AnyView(self.navigationViewStyle(StackNavigationViewStyle()))
    }
  }
}
