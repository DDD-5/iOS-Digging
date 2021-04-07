//
//  DiggingFolderView.swift
//  Digging
//
//  Created by 황재욱 on 2021/04/05.
//

import SwiftUI

struct DiggingFolderView: View {
  var body: some View {
    HStack {
      Image("digging_text_folder_img")
      VStack {
        Text("텍스트")
        Text("디깅 시작하세요")
      }
      Spacer()
      Image(systemName: "chevron.right")
    }.padding()
  }
}

struct DiggingFolderView_Previews: PreviewProvider {
  static var previews: some View {
    DiggingFolderView()
  }
}
