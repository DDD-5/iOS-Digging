//
//  ImageGridCellView.swift
//  Digging
//
//  Created by 황재욱 on 2021/04/07.
//

import SwiftUI

struct ImageGridCellView: View {
  var body: some View {
    DiggingGridCellView {
      HStack {
        Image.init("")
      }
    }
  }
}

struct ImageGridCellView_Previews: PreviewProvider {
  static var previews: some View {
    ImageGridCellView()
  }
}
