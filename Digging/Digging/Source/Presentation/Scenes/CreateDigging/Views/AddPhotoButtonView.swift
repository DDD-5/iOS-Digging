//
//  AddPhotoButtonView.swift
//  Digging
//
//  Created by 황재욱 on 2021/06/19.
//  Copyright © 2021 Oreo. All rights reserved.
//

import SwiftUI

struct AddPhotoButtonView: View {
  
  let buttonAction: () -> Void
  
  var body: some View {
    Button(action: {
      buttonAction()
    }, label: {
      Text("+")
        .foregroundColor(.grayBorder)
        .modifier(
          DiggingFont(
            type: .regular,
            size: 30
          )
        )
    })
    .frame(
      width: 105,
      height: 105
    )
    .overlay(
      RoundedRectangle(cornerRadius: 8)
        .stroke(Color.grayBorder, lineWidth: 1)
    )
  }
}

struct AddPhotoButtonView_Previews: PreviewProvider {
  static var previews: some View {
    AddPhotoButtonView(
      buttonAction: { })
  }
}
