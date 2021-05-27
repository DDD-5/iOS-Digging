//
//  NavigationBarColor.swift
//  Digging
//
//  Created by Gisu Hwang on 2021/05/27.
//  Copyright © 2021 Oreo. All rights reserved.
//

import SwiftUI

struct NavigationBarColor: ViewModifier {

	init(backgroundColor: UIColor, tintColor: UIColor) {
		let coloredAppearance = UINavigationBarAppearance()
		coloredAppearance.configureWithOpaqueBackground()
		coloredAppearance.backgroundColor = backgroundColor
		coloredAppearance.titleTextAttributes = [.foregroundColor: tintColor]
		coloredAppearance.largeTitleTextAttributes = [.foregroundColor: tintColor]

		UINavigationBar.appearance().standardAppearance = coloredAppearance
		UINavigationBar.appearance().scrollEdgeAppearance = coloredAppearance
		UINavigationBar.appearance().compactAppearance = coloredAppearance
		UINavigationBar.appearance().tintColor = tintColor
	}

	func body(content: Content) -> some View {
		content
	}
}

extension View {
	func navigationBarColor(backgroundColor: UIColor, tintColor: UIColor) -> some View {
		self.modifier(NavigationBarColor(backgroundColor: backgroundColor, tintColor: tintColor))
	}
}
