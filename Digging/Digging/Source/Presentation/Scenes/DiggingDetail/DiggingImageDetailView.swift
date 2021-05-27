//
//  DiggingImageDetailView.swift
//  Digging
//
//  Created by GisuHwang on 2021/05/23.
//  Copyright © 2021 Oreo. All rights reserved.
//

import SwiftUI

struct DiggingImageDetailView: View {
	@Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
	var gridLayout = [
		GridItem(.adaptive(minimum: 105, maximum: 105), spacing: 10)
	]
	
		var body: some View {
			ScrollView {
				VStack {
					
					DiggingDetailTitleView(title: "영감을 디깅하는 방법", date: "2021.04.21")
					
			
					LazyVGrid(
						columns: gridLayout,
						alignment: .leading,
						spacing: 15,
						content: {
							NavigationLink(
								destination: DiggingTextDetailView(),
								label: {
									DiggingGridCellView {
										
									}.frame(height: 105)
								})
					})
					.padding([.leading, .trailing], 20)
					
					Divider()
						.padding([.leading, .trailing], 20)
					Spacer()
					// TODO: merge 후 flowLayout 적용예정
				}
				.navigationBarItems(
					leading:
						HStack {
							Button(action: {
								self.presentationMode.wrappedValue.dismiss()
							}) {
								Image(R.image.back_btn_img.name)
							}
							DiggingFolderType.image.folderImage
								.resizable()
								.frame(width: 24, height: 24, alignment: .center)
							
							Text("이미지")
							
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
				.navigationBarColor(backgroundColor: .white, tintColor: .clear)
						.navigationBarBackButtonHidden(true)
			}
		}
}

struct DiggingImageDetailView_Previews: PreviewProvider {
    static var previews: some View {
        DiggingImageDetailView()
    }
}
