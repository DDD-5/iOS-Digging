//
//  CurrentDiggingWidgetCardView.swift
//  DiggingWidgetExtension
//
//  Created by 황재욱 on 2021/05/25.
//  Copyright © 2021 Oreo. All rights reserved.
//

import SwiftUI

struct CurrentDiggingWidgetCardView: View {
  var body: some View {
    Text("최근 Digging")
      .foregroundColor(.cardDarkGray)
      .modifier(
        DiggingFont(type: .bold, size: 11)
      )
      .padding([.leading], 20)
      .padding([.top], 18)
      .padding([.top], 16)
    DiggingRectangleCardView().padding([.leading, .trailing, .bottom], 20)
  }
}

struct CurrentDiggingWidgetCardView_Previews: PreviewProvider {
  static var previews: some View {
    CurrentDiggingWidgetCardView()
  }
}
