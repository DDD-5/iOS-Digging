//
//  MainIdeaStorageView.swift
//  Digging
//
//  Created by 황재욱 on 2021/04/04.
//

import SwiftUI

enum DiggingFolderType {
  case text
  case image
  case link
}

struct MainIdeaStorageView: View {
    var body: some View {
      ScrollView {
        VStack {
          HStack {
            Text("Digging과 함께\n영감을 수집해요💥")
            Spacer()
            Image("digging_main_top")
          }
          .padding(
            EdgeInsets(
              top: 40,
              leading: 20,
              bottom: 30,
              trailing: 20
            )
          )
          Section(
            header: Text("💡 내가 디깅한 영감"))
          {
            Text("Test")
          }
          Section(
            header: Text("💡 최근에 디깅한 영감"))
          {
            Text("Test")
          }
        }
      }
    }
}

struct MainIdeaStorageView_Previews: PreviewProvider {
    static var previews: some View {
      MainIdeaStorageView()
    }
}
