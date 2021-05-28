//
//  LinkGridCellView.swift
//  Digging
//
//  Created by 황재욱 on 2021/04/07.
//

import SwiftUI

struct LinkGridCellView: View {
  
  let diggingInfo: GeneralDiggingInfo
  
  @State var redraw: Bool = false
  
  var body: some View {
    DiggingGridCellView {
      if let urlString = diggingInfo.url,
         let url = URL(string: urlString) {
        URLInfoPreView(url: url, redraw: $redraw)
      }
    }
  }
}

struct LinkGridCellView_Previews: PreviewProvider {
  @State static var redraw: Bool = false
  
  static var previews: some View {
    LinkGridCellView(diggingInfo: GeneralDiggingInfo(content: nil, url: "https://www.naver.com", postID: 0, type: nil, title: nil), redraw: redraw)
  }
}
