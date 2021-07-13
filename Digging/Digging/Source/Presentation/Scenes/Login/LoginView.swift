//
//  LoginView.swift
//  Digging
//
//  Created by GisuHwang on 2021/04/06.
//  Copyright © 2021 Oreo. All rights reserved.
//

import SwiftUI


struct LoginView: View {
	var body: some View {
		
		ZStack {
			Color.diggingYellow.edgesIgnoringSafeArea(.all)
			VStack {
				
				HStack {
					Button(action: {}, label: {
						Image("close_icon_img")
							.frame(width: 24, height: 24, alignment: .topTrailing)
							.padding(
								EdgeInsets(top: 20, leading: 20, bottom: 20, trailing: 20)
							)
					})
					Spacer()
				}
				
				Spacer()
				
				Image(R.image.login_digging.name)
					.resizable()
					.frame(width: 197, height: 155, alignment: .center)
					.padding([.top], 70)
				Spacer()
				
				VStack {
					Text("로그인 또는 회원가입")
						.modifier(
							DiggingFont(
								type: .bold,
								size: 24
							)
						)
					Text("디깅에서 나만의 아이디어를 디깅하고 싶다면,\n지금 간단하게 시작해보세요!")
						.modifier(
							DiggingFont(
								type: .regular,
								size: 14
							)
						)
						.multilineTextAlignment(.center)
						.padding([.top], 20)
				}
				Button(action:{print("구글 로그인")}){
					HStack(alignment: .center) {
						Spacer()
						Image(R.image.googleLogo.name)
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
				.background(Color.white)
				.cornerRadius(8)
				.padding(EdgeInsets(top: 40, leading: 38, bottom: 0, trailing: 38))
				
				Button(action:{print("애플 로그인")}){
					HStack {
						Spacer()
						
						Image(R.image.appleLogo.name)
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
				.padding(EdgeInsets(top: 16, leading: 38, bottom: 0, trailing: 38))
				Spacer()
			}
		}
	}
}

struct LoginView_Previews: PreviewProvider {
	static var previews: some View {
		LoginView()
	}
}

