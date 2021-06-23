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
  var viewModel = MainIdeaStorageViewModel(
    useCase: MainIdeaStorageUseCase(repository: MainIdeaStorageRepositoryImpl())
  )
  
  var gridLayout = [
    GridItem(.adaptive(minimum: 160, maximum: 160), spacing: 15)
  ]
  
  // MARK: - Layout
  
  var body: some View {
    ScrollView {
      LazyVStack {
        HStack {
          Text("Digging과 함께\n영감을 수집해요💥")
            .modifier(
              DiggingFont(type: .bold, size: 24)
            )
          Spacer()
          LottieView(filename: "digging_lottie")
            .frame(width: 64, height: 64)
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
              DiggingFolderView(
                folderType: folderInfo.type
              )
              .padding(
                EdgeInsets(
                  top: 0,
                  leading: 20,
                  bottom: 8,
                  trailing: 20
                )
              )
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
						ForEach(viewModel.recentDiggingList, id: \.postID) { diggingInfo in
							// TODO: 원시 데이터가 아닌, 별도의 구조체를 활용하여 변경예정
							if let typeValue = diggingInfo.type,
								 let diggingType = DiggingFolderType(rawValue: typeValue) {
								
								switch diggingType {
								case .text:
									NavigationLink(
										destination: DiggingTextDetailView(viewModel: DiggingTextDetailViewModel(postID: diggingInfo.postID)),
										label: {
											determineProperDiggingCellView(diggingInfo: diggingInfo)
												.frame(height: 160)
										})
								case .link:
									NavigationLink(
										destination: DiggingLinkDetailView(viewModel: DiggingLinkDetailViewModel(postID: diggingInfo.postID)),
										label: {
											determineProperDiggingCellView(diggingInfo: diggingInfo)
												.frame(height: 160)
										})
								case .image:
									determineProperDiggingCellView(diggingInfo: diggingInfo)
										.frame(height: 160)
								}
							}
							
						}
					})
        .padding([.leading, .trailing], 20)
      }
      Spacer(minLength: 30)
    }
    .navigationBarHidden(true)
    .onAppear {
      viewModel.requestRecentDiggings(userID: 1)
    }
  }
  
  func determineProperDiggingCellView(diggingInfo: GeneralDiggingInfo) -> AnyView {
    
    guard let typeString = diggingInfo.type, let type = DiggingFolderType(rawValue: typeString) else {
      return AnyView(DiggingGridCellView { })
    }
    
    switch type {
    case .text:
      return AnyView(TextGridCellView(diggingInfo: diggingInfo))
    case .image:
      return AnyView(ImageGridCellView())
    case .link:
      return AnyView(LinkGridCellView(diggingInfo: diggingInfo))
    }
  }
}

struct MainIdeaStorageView_Previews: PreviewProvider {
  static var previews: some View {
    MainIdeaStorageView()
  }
}
