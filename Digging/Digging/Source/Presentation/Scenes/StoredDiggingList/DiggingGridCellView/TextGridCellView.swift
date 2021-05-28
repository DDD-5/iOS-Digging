//
//  TextGridCellView.swift
//  Digging
//
//  Created by 황재욱 on 2021/04/07.
//

import SwiftUI

struct TextGridCellView: View {
  
  let diggingInfo: GeneralDiggingInfo
  
  var body: some View {
    DiggingGridCellView {
      VStack(alignment: .leading) {
        Text(diggingInfo.title ?? "")
          .padding([.leading, .trailing], 13)
          .padding(.top, 44)
          .modifier(
            DiggingFont(type: .bold, size: 14)
          )
          .lineLimit(1)
        Text(diggingInfo.content ?? "")
          .padding([.horizontal, .bottom], 14)
          .padding(.top, 2)
          .modifier(
            DiggingFont(type: .regular, size: 12)
          )
          .lineLimit(0)
      }.frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .topLeading)
    }
  }
}

struct TextGridCellView_Previews: PreviewProvider {
  static var previews: some View {
    TextGridCellView(diggingInfo: GeneralDiggingInfo(content: nil, url: nil, postID: 0, type: nil, title: nil))
  }
}
