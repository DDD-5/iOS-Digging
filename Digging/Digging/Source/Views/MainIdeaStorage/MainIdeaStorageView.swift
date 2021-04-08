//
//  MainIdeaStorageView.swift
//  Digging
//
//  Created by 황재욱 on 2021/04/04.
//

import SwiftUI

struct MainIdeaStorageView: View {
  
  @ObservedObject
  var viewModel = MainIdeaStorageViewModel()
  
  var body: some View {
    List {
      HStack {
        Text("Digging과 함께\n영감을 수집해요💥")
          .font(
            .custom("AppleSDGothicNeo-Bold", size: 24)
          )
        Spacer()
        Image("digging_main_top")
      }
      .padding(
        EdgeInsets(
          top: 20,
          leading: 20,
          bottom: 32,
          trailing: 20
        )
      )
      Section(
        header: MainIdeaStorageHeaderView(title: "💡 내가 디깅한 영감")
      )
      {
        ForEach(viewModel.folderInfoArray) { folderInfo in
          ZStack {
            DiggingFolderView(title: "", description: "")
            NavigationLink(
              destination: StoredDiggingListView())
            {
              EmptyView()
            }
            .buttonStyle(PlainButtonStyle())
            .frame(width: 0)
            .opacity(0.0)
          }
        }
      }
      
      Section(
        header: MainIdeaStorageHeaderView(
          title: "💡 최근에 디깅한 영감"
        )
        .padding(.top, 28)
      )
      {
        LazyVGrid(columns: [
          GridItem(.adaptive(minimum: 120, maximum: 160), spacing: 20)
        ], content: {
          DiggingGridCellView().frame(height: 160)
          DiggingGridCellView().frame(height: 160)
        })
      }
      .background(Color.white)
    }
    .onAppear(perform: {
      // TODO: Remove - bug fix를 위한 temp code
      UITableView.appearance().showsVerticalScrollIndicator = false
      UITableView.appearance().tableFooterView = UIView()
    })
    .navigationBarHidden(true)
  }
}

struct MainIdeaStorageView_Previews: PreviewProvider {
  static var previews: some View {
    MainIdeaStorageView()
  }
}
