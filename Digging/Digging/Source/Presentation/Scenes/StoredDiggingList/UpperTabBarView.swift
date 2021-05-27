//
//  UpperTabBarView.swift
//  Digging
//
//  Created by 황재욱 on 2021/04/08.
//  Copyright © 2021 Oreo. All rights reserved.
//

import SwiftUI

enum SelectedType: Int {
  case total = 0
  case liked
}

struct UpperTabBarView: View {
  // MARK: - State Properties
  
  @State private var selectionState: Int = 0 {
      didSet {
          selection = selectionState
      }
  }
  
  // MARK: - Binding Properties
  
  @Binding var selection: Int
  
  // MARK: - Properties
  
  let tabs: [String]
  
  let font: Font
  
  let animation: Animation
  
  let activeAccentColor: Color
  
  let inactiveAccentColor: Color
  
  let selectionBarColor: Color
  
  let inactiveTabColor: Color
  
  let activeTabColor: Color
  
  let selectionBarHeight: CGFloat
  
  let selectionBarBackgroundColor: Color
  
  let selectionBarBackgroundHeight: CGFloat
  
  // MARK: - Constructor
  
  public init(
    selection: Binding<Int>,
    tabs: [String],
    font: Font = .body,
    animation: Animation = .spring(),
    activeAccentColor: Color = .blue,
    inactiveAccentColor: Color = Color.black.opacity(0.4),
    selectionBarColor: Color = .blue,
    inactiveTabColor: Color = .clear,
    activeTabColor: Color = .clear,
    selectionBarHeight: CGFloat = 2,
    selectionBarBackgroundColor: Color = Color.gray.opacity(0.2),
    selectionBarBackgroundHeight: CGFloat = 1) {
      self._selection = selection
      self.tabs = tabs
      self.font = font
      self.animation = animation
      self.activeAccentColor = activeAccentColor
      self.inactiveAccentColor = inactiveAccentColor
      self.selectionBarColor = selectionBarColor
      self.inactiveTabColor = inactiveTabColor
      self.activeTabColor = activeTabColor
      self.selectionBarHeight = selectionBarHeight
      self.selectionBarBackgroundColor = selectionBarBackgroundColor
      self.selectionBarBackgroundHeight = selectionBarBackgroundHeight
  }
  
  public var body: some View {
      assert(tabs.count > 1, "Must have at least 2 tabs")
      
      return VStack(alignment: .leading, spacing: 0) {
          HStack(spacing: 0) {
              ForEach(self.tabs, id:\.self) { tab in
                  Button(action: {
                      let selection = self.tabs.firstIndex(of: tab) ?? 0
                      self.selectionState = selection
                  }) {
                      HStack {
                          Spacer()
                          Text(tab).font(self.font)
                          Spacer()
                      }
                  }
                  .padding(.vertical, 16)
                      .accentColor(
                          self.isSelected(tabIdentifier: tab)
                              ? self.activeAccentColor
                              : self.inactiveAccentColor)
                      .background(
                          self.isSelected(tabIdentifier: tab)
                              ? self.activeTabColor
                              : self.inactiveTabColor)
              }
          }
          GeometryReader { geometry in
              ZStack(alignment: .leading) {
                  Rectangle()
                      .fill(self.selectionBarColor)
                      .frame(width: self.tabWidth(from: geometry.size.width), height: self.selectionBarHeight, alignment: .leading)
                      .offset(x: self.selectionBarXOffset(from: geometry.size.width), y: 0)
                      .animation(self.animation)
                  Rectangle()
                      .fill(self.selectionBarBackgroundColor)
                      .frame(width: geometry.size.width, height: self.selectionBarBackgroundHeight, alignment: .leading)
              }.fixedSize(horizontal: false, vertical: true)
          }.fixedSize(horizontal: false, vertical: true)
          
      }
  }
  
  // MARK: Private Helper
  
  private func isSelected(tabIdentifier: String) -> Bool {
    guard selectionState < tabs.count else { return false }
    
      return tabs[selectionState] == tabIdentifier
  }
  
  private func selectionBarXOffset(from totalWidth: CGFloat) -> CGFloat {
      return self.tabWidth(from: totalWidth) * CGFloat(selectionState)
  }
  
  private func tabWidth(from totalWidth: CGFloat) -> CGFloat {
      return totalWidth / CGFloat(tabs.count)
  }
}

struct UpperTabBarView_Previews: PreviewProvider {
  @State static var selection: Int = 0
  static var previews: some View {
    UpperTabBarView(selection: $selection, tabs: ["test", "test2"])
  }
}
