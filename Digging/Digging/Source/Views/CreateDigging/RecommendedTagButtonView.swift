//
//  RecommendedTagButtonView.swift
//  Digging
//
//  Created by 황재욱 on 2021/04/12.
//  Copyright © 2021 Oreo. All rights reserved.
//

import SwiftUI

struct RecommendedTagButtonView: View {
  var tagName: String
  
  var body: some View {
    Text(tagName)
      .padding(.vertical, 10)
      .padding(.horizontal)
      .background(
        Capsule()
          .stroke(Color.black, lineWidth: 1)
      )
  }
}

struct RecommendedTagButtonView_Previews: PreviewProvider {
  static var previews: some View {
    RecommendedTagButtonView(tagName: "Test")
  }
}
