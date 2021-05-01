//
//  SelectDiggingView.swift
//  Digging
//
//  Created by Gisu Hwang on 2021/04/23.
//  Copyright © 2021 Oreo. All rights reserved.
//

import SwiftUI

struct SelectDiggingView: View {
	var body: some View {

		VStack(spacing: 0) {

			HStack {
				Button(action: {
					print("Button Close")

				})
				{
					Image(R.image.close.name)
						.resizable()
						.frame(width: 24, height: 24)
						.padding(
							EdgeInsets(top: 20, leading: 20, bottom: 20, trailing: 20)
						)
				}
				Text("템플릿 선택하기")
					.frame(maxWidth: .infinity, alignment: .leading)
					.font(Font.custom("AppleSDGothicNeo-Bold", size: 16))

			}
			Divider()
			// TODO: 뷰모델로 처리예정
			List{
				SelectDiggingCategoryView(title: "텍스트", image: R.image.digging_text_folder_img.name)
				SelectDiggingCategoryView(title: "사진", image: R.image.digging_text_folder_img.name)
				SelectDiggingCategoryView(title: "링크", image: R.image.digging_text_folder_img.name)

			}
		}
		.background(Color.white)

	}

	
}

struct SelectDiggingView_Previews: PreviewProvider {
    static var previews: some View {
        SelectDiggingView()
    }
}

struct SelectDiggingCategoryView: View {
	var title: String
	var image: String

	var body: some View {
		HStack {
			ZStack {
				Color(r: 246, g: 246, b: 246)
				Image(image).resizable()
					.frame(width: 24, height: 24, alignment: .center)
			}
			.cornerRadius(24)
			.frame(width: 48, height: 48, alignment: .center)
			
			Text(title)
				.font(
					.custom("AppleSDGothicNeo-Bold", size: 16)
				)
				.frame(alignment: .leading)
			Spacer()
		}.padding()
	}
}

struct SelectDiggingCategoryView_Previews: PreviewProvider {
	static var previews: some View {
		SelectDiggingCategoryView(title: "text", image: R.image.digging_text_folder_img.name)
	}
}


extension Color {
	init(r: Double, g: Double, b: Double, opacity: Double = 1) {
		self.init(red: r / 255, green: g / 255, blue: b / 255, opacity: opacity)
	}
}
