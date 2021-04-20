//
//  DiggingFont.swift
//  Digging
//
//  Created by 황재욱 on 2021/04/19.
//  Copyright © 2021 Oreo. All rights reserved.
//

import SwiftUI

struct DiggingFont: ViewModifier {
  
  // MARK: - Properties
  
  var type: DiggingFontType
  
  var size: CGFloat
  
  // MARK: - Internal methods
  
  func body(content: Content) -> some View {
    content.font(Font.custom(type.fontName, size: size))
  }
}
