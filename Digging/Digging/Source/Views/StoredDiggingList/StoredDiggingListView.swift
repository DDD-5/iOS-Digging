//
//  StoredDiggingListView.swift
//  Digging
//
//  Created by 황재욱 on 2021/04/07.
//

import SwiftUI

struct StoredDiggingListView: View {
  @State var selection: SelectedType = .total
    var body: some View {
      VStack {
        UpperTabBarView(selection: $selection)
        if #available(iOS 14.0, *) {
          LazyVGrid(columns: [
            GridItem(.adaptive(minimum: 160))
          ], content: {
            DiggingGridCellView().frame(height: 160)
            DiggingGridCellView().frame(height: 160)
            DiggingGridCellView().frame(height: 160)
          })
        } else {
          // Fallback on earlier versions
        }
      }
    }
}

struct StoredDiggingListView_Previews: PreviewProvider {
    static var previews: some View {
        StoredDiggingListView()
    }
}
