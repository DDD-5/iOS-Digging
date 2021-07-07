//
//  CalendarDateInfoView.swift
//  Digging
//
//  Created by 황재욱 on 2021/04/26.
//  Copyright © 2021 Oreo. All rights reserved.
//

import SwiftUI

struct CalendarDateInfoView: View {
  let dateInfo: MyDiggingDateInfo
  
  var body: some View {
    VStack(spacing: 4) {
      /*Text(dateInfo.dataNumber == 0 ? "" : "\(dateInfo.dataNumber)")
        .modifier(
          DiggingFont(
            type: .regular,
            size: 16
          )
        )
        .foregroundColor(.calendarGray)
        .background(
          Circle()
            .foregroundColor(.clear)
            .frame(
              width: 32,
              height: 32
            )
        )*/
      /*if dateInfo.isStored {
        HStack {
          CalendarStoredDisplayCircle().foregroundColor(.red)
          CalendarStoredDisplayCircle().foregroundColor(.blue)
          CalendarStoredDisplayCircle().foregroundColor(.yellow)
        }
      }*/
    }
  }
}

struct CalendarDateInfoView_Previews: PreviewProvider {
  static var previews: some View {
    CalendarDateInfoView(dateInfo: MyDiggingDateInfo(date: nil, day: nil, id: nil, isImage: nil, isLink: nil, isText: nil, resultCode: nil))
  }
}
