//
//  MainIdeaStorageView.swift
//  Digging
//
//  Created by 황재욱 on 2021/04/04.
//

import SwiftUI

struct MainIdeaStorageView: View {
  
  // MARK: - Properties
  
  @ObservedObject
  var viewModel = MainIdeaStorageViewModel()
  
  var gridLayout = [
    GridItem(.adaptive(minimum: 160, maximum: 160), spacing: 15)
  ]
  
  // MARK: - Layout
  
  var body: some View {
    ScrollView {
      LazyVStack {
        HStack {
          Text("Digging과 함께\n영감을 수집해요💥")
            .font(
              .custom("AppleSDGothicNeo-Bold", size: 24)
            )
          Spacer()
          Image("digging_main_top")
        }
        .ignoresSafeArea()
        .padding(
          EdgeInsets(
            top: 20,
            leading: 20,
            bottom: 32,
            trailing: 20
          )
        )
        MainIdeaStorageHeaderView(title: "💡 내가 디깅한 영감")
          .padding(.bottom, 5)
        ForEach(viewModel.folderInfoArray) { folderInfo in
          ZStack {
            NavigationLink(
              destination: StoredDiggingListView())
            {
              DiggingFolderView(title: "", description: "")
                .padding(EdgeInsets(top: 0, leading: 20, bottom: 8, trailing: 20))
            }
          }
        }
        
        MainIdeaStorageHeaderView(
          title: "💡 최근에 디깅한 영감"
        )
        .padding(.top, 20)
        
        LazyVGrid(
          columns: gridLayout,
          alignment: .leading,
          spacing: 15,
          content: {
						NavigationLink(
							destination: DiggingTextDetailView(),
							label: {
								DiggingGridCellView {
									
								}.frame(height: 160)
							})
						NavigationLink(
							destination: DiggingLinkDetailView(),
							label: {
								DiggingGridCellView {
									
								}.frame(height: 160)
							})
        })
        .padding([.leading, .trailing], 20)
      }
      Spacer(minLength: 30)
    }
    .navigationBarHidden(true)
  }
}

struct MainIdeaStorageView_Previews: PreviewProvider {
  static var previews: some View {
    MainIdeaStorageView()
  }
}
