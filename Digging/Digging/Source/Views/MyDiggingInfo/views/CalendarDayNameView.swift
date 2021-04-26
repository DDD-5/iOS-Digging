//
//  CalendarDayNameView.swift
//  Digging
//
//  Created by 황재욱 on 2021/04/26.
//  Copyright © 2021 Oreo. All rights reserved.
//

import SwiftUI

struct CalendarDayNameView: View {
  
  // MARK: - Properties
  
  var dayName: String
  
  // MARK: - SetupUI
  
  var body: some View {
    Text(dayName)
      .modifier(
        DiggingFont(
          type: .bold,
          size: 28
        )
      )
  }
}

struct CalendarDayNameView_Previews: PreviewProvider {
  static var previews: some View {
    CalendarDayNameView(dayName: "S")
  }
}
