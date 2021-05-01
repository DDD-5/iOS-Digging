//
//  DiggingGridCellView.swift
//  Digging
//
//  Created by 황재욱 on 2021/04/07.
//

import SwiftUI

struct DiggingGridCellView<T: View>: View {
  
  // MARK: - UI Components
  
  var content: T
  
  var likeButtonView: Button<Image> {
    return Button(action: {}, label: {
      Image.init("")
    })
  }
  
  init(@ViewBuilder content: () -> T) {
    self.content = content()
  }
  
  var body: some View {
    
    GeometryReader { geometry in
      ZStack {
        Color(red: 246/255, green: 246/255, blue: 246/255)
          .cornerRadius(10)
        content
        likeButtonView
          .offset(x: 128, y: 8)
      }
    }
  }
}

struct DiggingGridCellView_Previews: PreviewProvider {
  static var previews: some View {
    DiggingGridCellView {
      Text("")
    }
  }
}
