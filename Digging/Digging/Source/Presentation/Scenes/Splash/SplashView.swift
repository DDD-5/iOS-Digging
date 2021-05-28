//
//  SplashView.swift
//  Digging
//
//  Created by GisuHwang on 2021/05/28.
//  Copyright © 2021 Oreo. All rights reserved.
//

import SwiftUI
import UIKit
import Lottie

struct SplashView: UIViewRepresentable {
	
	// MARK: - Properties
	
	let filename: String = "digging_illust_lottie"
	
	// MARK: - Internal methods
	
	func makeUIView(context: Context) -> UIView {
		let view = UIView()
		let lottieView = AnimationView(name: filename)
		lottieView.loopMode = .playOnce
		lottieView.play()
		lottieView.contentMode = .scaleAspectFit
		lottieView.backgroundBehavior = .pauseAndRestore
		lottieView.translatesAutoresizingMaskIntoConstraints = false
		view.addSubview(lottieView)
		
		NSLayoutConstraint.activate([
			lottieView.widthAnchor.constraint(equalTo: view.widthAnchor),
			lottieView.heightAnchor.constraint(equalTo: view.heightAnchor)
		])
		
		return view
		
	}
	
	func updateUIView(_ uiView: UIView, context: Context) {
		
		rootViewChangeMainTabBar()
	}

}

extension SplashView {
	private func rootViewChangeMainTabBar() {
		DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
			let mainTabivew = UIHostingController(rootView: MainTabBarView())
			UIWindow(frame: UIScreen.main.bounds).switchRootViewController(rootViewController: mainTabivew, animated: true) {
				
			}
		}
	}
}
