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
				Text("로그인 또는 회원 가입")
					.frame(maxWidth: .infinity, alignment: .leading)
					.font(Font.custom("AppleSDGothicNeo-Bold", size: 16))

			}
			Divider()

			VStack(spacing: 20, content: {
				Text("디깅에서 나만의 영감을 디깅하고 싶다면,\n지금 간단하게 시작해보세요!")
					.multilineTextAlignment(.center)
					.font(Font.custom("AppleSDGothicNeo-Regular", size: 14))

				Button(action:{print("구글 로그인")}){
					HStack(alignment: .center) {
						Spacer()
						Image(R.image.close.name)
							.resizable()
							.frame(width: 24, height: 24)
						Text("구글 로그인")
							.font(Font.custom("AppleSDGothicNeo-Bold", size: 16))
							.foregroundColor(Color(red: 96 / 255, green: 96 / 255, blue: 96 / 255)
							)

						Spacer()
					}
					.padding(EdgeInsets(top: 10, leading: 0, bottom: 10, trailing: 0))


				}
				.background(RoundedRectangle(cornerRadius: 8).stroke(Color.black, lineWidth: /*@START_MENU_TOKEN@*/1.0/*@END_MENU_TOKEN@*/))
				.padding(EdgeInsets(top: 0, leading: 38, bottom: 0, trailing: 38))

				Button(action:{print("애플 로그인")}){
					HStack {
						Spacer()

						Image(R.image.close.name)
							.resizable()
							.frame(width: 24, height: 24)
						Text("애플 로그인")
							.font(Font.custom("AppleSDGothicNeo-Bold", size: 16))
							.foregroundColor(Color.white)

						Spacer()
					}
					.padding(EdgeInsets(top: 10, leading: 0, bottom: 10, trailing: 0))

				}
				.background(Color.black)
				.cornerRadius(8)
				.padding(EdgeInsets(top: 0, leading: 38, bottom: 0, trailing: 38))



			})
			.padding(EdgeInsets(top: 10, leading: 10, bottom: 0, trailing: 10))

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
