//
//  DiggingRectangleCardView.swift
//  Digging
//
//  Created by 황재욱 on 2021/04/29.
//  Copyright © 2021 Oreo. All rights reserved.
//

import SwiftUI

struct DiggingRectangleCardView: View {
  var body: some View {
    VStack(alignment: .leading) {
      HStack(alignment: .top) {
        Image("digging_text_folder_small_img")
          .frame(width: 20, height: 20)
        Text("제목디자인제목텍스트").modifier(
          DiggingFont(type: .bold, size: 14)
        )
      }
      .padding([.top, .leading], 10)
      .padding([.bottom], 12)
      VStack(
        alignment: .leading,
        spacing: 8
      ) {
        Text("요즘 디깅 한다는 말을 많이 사용한다. 나도 인스타그램에 디깅을 많이 보긴 하는데 실제로 요즘 디깅 한다는 말을 많이 사용한다. 나 ···  ")
          .modifier(
            DiggingFont(type: .regular, size: 12)
          )
        Text("태그 | 디자인 | ui | 일반개발  ")
          .foregroundColor(.lightGray)
          .modifier(
            DiggingFont(type: .regular, size: 12)
          )
      }
      .padding( [.leading, .trailing], 20)
      .padding(.bottom, 10)
    }
    .overlay(RoundedRectangle(cornerRadius: 8)
              .stroke(
                Color.grayBorder,
                lineWidth: 1
              )
    )
  }
}

struct DiggingRectangleCardView_Previews: PreviewProvider {
  static var previews: some View {
    DiggingRectangleCardView()
  }
}
