//
//  DateLabelView.swift
//  Digging
//
//  Created by 황재욱 on 2021/04/26.
//  Copyright © 2021 Oreo. All rights reserved.
//

import SwiftUI

// MARK: - DateLabelState

enum DateLabelState {
  case today
  case notSelected
  case selected
}

struct DateLabelView: View {
  
  // MARK: - Properties
  
  @Binding var state: DateLabelState
  
  let dateNumber: Int
  
  // MARK: - SetupUI
  
  var body: some View {
    Text("\(dateNumber)")
  }
}

struct DateLabelView_Previews: PreviewProvider {
  static var previews: some View {
    DateLabelView(
      dateNumber: 1,
      state: .today
    )
  }
}
