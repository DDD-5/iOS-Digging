//
//  DiggingListNavigationBar.swift
//  Digging
//
//  Created by 황재욱 on 2021/04/12.
//  Copyright © 2021 Oreo. All rights reserved.
//

import SwiftUI

struct DiggingListNavigationBar: View {
  
  // MARK: - Properties
  
  @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
  @State private var selectedCategory = "텍스트"
  
  // MARK: - Layout
  
  var body: some View {
    HStack {
      Button(action: {
        self.presentationMode.wrappedValue.dismiss()
      }, label: {
        Image("back_btn_img")
      })
      Picker(
        selection: $selectedCategory,
        label: HStack {
          Image("digging_text_folder_small_img")
          Text(selectedCategory)
          Image("dropdown_icon_img")
        },
      content: {
        Text("텍스트").tag(1)
        Text("이미지").tag(2)
        Text("링크").tag(3)
      })
      .pickerStyle(MenuPickerStyle())
    }
  }
}

struct DiggingListNavigationBar_Previews: PreviewProvider {
  static var previews: some View {
    DiggingListNavigationBar()
  }
}
