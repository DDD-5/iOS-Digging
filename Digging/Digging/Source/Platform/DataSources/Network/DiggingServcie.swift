//
//  DiggingServcie.swift
//  Digging
//
//  Created by GisuHwang on 2021/05/24.
//  Copyright © 2021 Oreo. All rights reserved.
//

import Moya

enum DiggingServcie {
	// TODO: 로그인 개발후 헤더에 주입 예정 - 임시 userID 처리
	case createDigging
	case diggingList(userID: String)
	case diggingDetail(diggingID: String)
	case totalTags(userID: String)
	case test
	case diggingDetailText(userID: String)
}

extension DiggingServcie: BaseService {
	var path: String {
		switch self {
			case .createDigging:
				return ""
			case .diggingList(let userID):
				return ""
			case .diggingDetail(let diggingID):
				return ""
			case .totalTags(let userID):
				return "/api/user/get_total_tags"
			case .test:
				return"/posts"
		case .diggingDetailText:
			return "/posttext"
		}
	}
	
	var method: Moya.Method {
		switch self {
			case .createDigging:
				return .post
			case .diggingList:
				return .get
			case .diggingDetail:
				return .get
			case .totalTags:
				return .get
			case.test:
				return .get
		case .diggingDetailText:
			return .get
		}
	}
	
	var task: Task {
		guard let parameters = parameters else { return .requestPlain }
		var body: [String: Any] = [:]
		
		switch self {
			case .createDigging:
				return .requestCompositeParameters(bodyParameters: body, bodyEncoding: parameterEncoding, urlParameters: parameters)
		case .diggingList, .diggingDetail, .totalTags, .diggingDetailText:
				return .requestParameters(parameters: parameters, encoding: parameterEncoding)
			case .test:
				return .requestParameters(parameters: parameters, encoding: parameterEncoding)
		}
	}
	
	var parameters: [String: Any]? {
		
		let defaultParameters: [String: Any] = [
			"platform": "ios",
		]
		
		var parameters: [String: Any] = defaultParameters
		
		switch self {
			case .createDigging:
				return parameters
			case .diggingList(let userID):
				return parameters
			case .diggingDetail(let diggingID):
				return parameters
			case .totalTags(let userID):
				return parameters
			case .test:
				return parameters
		case .diggingDetailText(let userID):
			// userid=13&postid=11
			parameters.concat(dict: ["userid": userID])
			return parameters
		}
	}
	
	var parameterEncoding: ParameterEncoding {
		switch self {
			case .createDigging:
				return JSONEncoding.default
		case .diggingList, .diggingDetail, .totalTags, .diggingDetailText:
				return URLEncoding.queryString
			case .test:
				return URLEncoding.queryString
		}
	}
}
