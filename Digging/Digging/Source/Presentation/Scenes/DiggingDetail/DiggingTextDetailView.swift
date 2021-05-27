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

	var body: some View {
		ScrollView {
			VStack {

				DiggingDetailTitleView(title: "영감을 디깅하는 방법", date: "2021.04.21")

				DiggingDetailContentTextView(contentText: """
			요즘 디깅 한다는 말을 많이 사용한다. 나도 인스타그램에 디깅을 많이 보긴 하는데 실제로 사용해본 적은 없는것 같다. 요즘 디깅 한다는 말을 많이 사용한다. 나도 인스타그램에서 디깅을 많이 보긴 하는데 실제로 사용해본 적은 없는것 같다.요즘 디깅 한다는 말을 많이 사용한다. 나도 인스타그램에서 디깅을 많이 보긴 하는데 실제로 사용해본 적은 없는것 같다. 요즘 디
			""")

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
			.navigationBarColor(backgroundColor: .white, tintColor: .clear)
			.navigationBarBackButtonHidden(true)

		}

	}

	
}

struct DiggingTextDetailView_Previews: PreviewProvider {
    static var previews: some View {
        DiggingTextDetailView()
    }
}

struct Test: Codable {
	var a: String
}
