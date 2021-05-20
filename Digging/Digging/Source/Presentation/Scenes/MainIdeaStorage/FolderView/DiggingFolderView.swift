//
//  DiggingFolderView.swift
//  Digging
//
//  Created by 황재욱 on 2021/04/05.
//

import SwiftUI

struct DiggingFolderView: View {
  var folderType: DiggingFolderType
  var description: String = "디깅을 시작해볼까요?"
  
  var body: some View {
    HStack {
      folderType.folderImage
      VStack {
        HStack {
          Text(folderType.rawValue)
            .font(
              .custom("AppleSDGothicNeo-Bold", size: 16)
            )
            .frame(alignment: .leading)
          Spacer()
        }
        HStack {
          Text(description)
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
    DiggingFolderView(folderType: .image)
  }
}
