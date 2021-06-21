//
//  LogintBottomSheetView.swift
//  Digging
//
//  Created by Gisu Hwang on 2021/06/21.
//  Copyright © 2021 Oreo. All rights reserved.
//

import SwiftUI

struct LogintBottomSheetView: View {
	var body: some View {

		VStack(spacing: 0) {

			ZStack{
				Text("로그인 또는 회원 가입")
					.frame(maxWidth: .infinity, alignment: .center)
					.font(Font.custom("AppleSDGothicNeo-Bold", size: 16))
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
					Spacer()

				}



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

struct LogintBottomSheetView_Previews: PreviewProvider {
    static var previews: some View {
        LogintBottomSheetView()
    }
}
