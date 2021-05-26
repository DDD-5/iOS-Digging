//
//  NetworkPlugin.swift
//  Digging
//
//  Created by Gisu Hwang on 2021/05/25.
//  Copyright © 2021 Oreo. All rights reserved.
//


import Moya

final class AccessTokenPlugin: PluginType {
	
	func prepare(_ request: URLRequest, target: TargetType) -> URLRequest {

		var request = request

		return request
	}
}
