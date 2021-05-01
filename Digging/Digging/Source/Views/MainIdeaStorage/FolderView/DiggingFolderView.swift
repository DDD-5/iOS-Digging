//
//  DiggingFolderView.swift
//  Digging
//
//  Created by 황재욱 on 2021/04/05.
//

import SwiftUI

struct DiggingFolderView: View {
  var title: String
  var description: String
  
  var body: some View {
    HStack {
      Image("digging_text_folder_img")
      VStack {
        HStack {
          Text("텍스트")
            .font(
              .custom("AppleSDGothicNeo-Bold", size: 16)
            )
            .frame(alignment: .leading)
          Spacer()
        }
        HStack {
          Text("디깅을 시작해볼까요?")
            .font(
              .custom("AppleSDGothicNeo-Regular", size: 14)
            )
            .foregroundColor(Color(red: 85/255, green: 85/255, blue: 85/255))
            .frame(alignment: .leading)
          Spacer()
        }
      }
      Spacer()
      Image(systemName: "chevron.right")
    }
    .padding()
    .background(Color(red: 246/255, green: 246/255, blue: 246/255))
    .cornerRadius(10)
  }
}

struct DiggingFolderView_Previews: PreviewProvider {
  static var previews: some View {
    DiggingFolderView(title: "text", description: "")
  }
}
