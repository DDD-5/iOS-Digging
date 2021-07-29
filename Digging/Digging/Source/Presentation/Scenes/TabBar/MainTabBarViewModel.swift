//
//  MainTabBarViewModel.swift
//  Digging
//
//  Created by GisuHwang on 2021/04/21.
//  Copyright © 2021 Oreo. All rights reserved.
//

import SwiftUI
import Combine

class MainTabBarViewModel: ObservableObject {

	let customActionteminidex: Int

	let objectWillChange = PassthroughSubject<MainTabBarViewModel, Never>()

	@Published var isTapMainIdeaStorage: Bool = false


	var itemSelected: Int {
		didSet {
			if itemSelected == customActionteminidex {
				itemSelected = oldValue
				isCustomItemSelected = true
			}

			objectWillChange.send(self)
		}
		willSet {

			isTapMainIdeaStorage = newValue == 1
		}
	}

	/// This is true when the user has selected the Item with the custom action
	var isCustomItemSelected: Bool = false

	init(initialIndex: Int = 0, customItemIndex: Int) {
		self.customActionteminidex = customItemIndex
		self.itemSelected = initialIndex
	}
}
