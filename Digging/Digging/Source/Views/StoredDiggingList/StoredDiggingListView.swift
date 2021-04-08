//
//  StoredDiggingListView.swift
//  Digging
//
//  Created by 황재욱 on 2021/04/07.
//

import SwiftUI

struct StoredDiggingListView: View {
  
  // MARK: - Properties
  
  @State var selection: SelectedType = .total
  
  // MARK: - Layout
  
  var body: some View {
    VStack(alignment: .leading) {
      UpperTabBarView(selection: $selection)
      LazyVGrid(columns: [
        GridItem(.adaptive(minimum: 120, maximum: 160), spacing: 20)
      ], content: {
        DiggingGridCellView().frame(height: 160)
        DiggingGridCellView().frame(height: 160)
      })
      Spacer()
    }
    .navigationBarTitle(
      Text("Title"),
      displayMode: .inline
    )
  }
}

struct StoredDiggingListView_Previews: PreviewProvider {
  static var previews: some View {
    StoredDiggingListView()
  }
}
