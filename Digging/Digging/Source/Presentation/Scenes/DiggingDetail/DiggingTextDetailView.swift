//
//  DiggingTextDetailView.swift
//  Digging
//
//  Created by GisuHwang on 2021/05/20.
//  Copyright © 2021 Oreo. All rights reserved.
//

import SwiftUI
import Combine

struct DiggingTextDetailView: View {
	@Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
	@State var recommendedTagList = ["일반 개발", "웹 개발", "Javascript", "React", "Vue.js", "Angular", "Node.js"]
	@ObservedObject var viewModel: DiggingTextDetailViewModel
	
	init(viewModel: DiggingTextDetailViewModel) {
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
									 items: $recommendedTagList) {
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
						DiggingFolderType.text.folderImage
							.resizable()
							.frame(width: 24, height: 24, alignment: .center)
						
						Text("텍스트")
						
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
			.onAppear { self.viewModel.fetchDiggingTextInfo()}
			.navigationBarTitleDisplayMode(.inline)
			.navigationBarColor(backgroundColor: .white, tintColor: .clear)
			.navigationBarBackButtonHidden(true)
		}
	}
}

extension DiggingTextDetailView {
	func titleView() -> some View {
		return DiggingDetailTitleView(title: viewModel.textDetailDTO.title, date: viewModel.textDetailDTO.updateDate)
	}
	
	func contentView() -> some View {
		return DiggingDetailContentTextView(contentText: viewModel.textDetailDTO.content)
	}
}

struct DiggingTextDetailView_Previews: PreviewProvider {
	static var previews: some View {
		DiggingTextDetailView(viewModel: DiggingTextDetailViewModel(postID: 0))
	}
}

