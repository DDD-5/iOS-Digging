//
//  DiggingLinkDetailView.swift
//  Digging
//
//  Created by GisuHwang on 2021/05/23.
//  Copyright © 2021 Oreo. All rights reserved.
//

import SwiftUI

struct DiggingLinkDetailView: View {
	@Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
	@ObservedObject var viewModel: DiggingLinkDetailViewModel
	
	init(viewModel: DiggingLinkDetailViewModel) {
		self.viewModel = viewModel
	}
	
	var body: some View {
		ScrollView {
			VStack {
				
				titleView()
					.padding([.top], 20)
				
				contentView()
				
				Divider()
					.padding([.leading, .trailing], 20)
				Spacer()

				FlowLayout(mode: .scrollable,
									 binding: .constant(5),
									 items: $viewModel.tags) {
					Text($0)
						.foregroundColor(.white)
						.modifier(DiggingFont(type: .medium, size: 14))
						.padding([.leading, .trailing], 14)
						.padding([.top, .bottom], 10)
						.background(Color.tagFillColor.cornerRadius(18))
				}
				.padding([.top], 24)
				.padding([.leading, .trailing], 20)
			}
			.navigationBarItems(
				leading:
					HStack {
						Button(action: {
							self.presentationMode.wrappedValue.dismiss()
						}) {
							Image(R.image.back_btn_img.name)
						}
						DiggingFolderType.link.folderImage
							.resizable()
							.frame(width: 24, height: 24, alignment: .center)
						
						Text("링크")
						
					},
				trailing:
					HStack {
						Button(action: {
							print("좋아요")
						}) {
							
							Image(R.image.digging_like_deselect.name)
								.resizable()
								.frame(width: 24, height: 24, alignment: .center)
						}
						Button(action: {
							print("작성")
						}) {
							Image(R.image.digging_write.name)
								.resizable()
								.frame(width: 24, height: 24, alignment: .center)
						}
						
						Button(action: {
							print("삭제")
						}) {
							Image(R.image.digging_delete.name)
								.resizable()
								.frame(width: 24, height: 24, alignment: .center)
						}
						
					})
			.onAppear { self.viewModel.fetchDiggingLinkInfo()}
			.navigationBarTitleDisplayMode(.inline)
			.navigationBarColor(backgroundColor: .white, tintColor: .clear)
			.navigationBarBackButtonHidden(true)
		}
	}
}

extension DiggingLinkDetailView {
	func titleView() -> some View {
		return DiggingDetailTitleView(title: viewModel.linkDetailDTO.title, date: viewModel.linkDetailDTO.updateDate)
	}
	
	func contentView() -> some View {
		return
			DiggingDetailLinkView(linkURL: viewModel.linkDetailDTO.url)
	}
}


struct DiggingLinkDetailView_Previews: PreviewProvider {
	static var previews: some View {
		DiggingLinkDetailView(viewModel: DiggingLinkDetailViewModel(postID: 1))
	}
}
