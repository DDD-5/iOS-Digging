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
	case appleLogin(token: String, userEmail: String)
	case diggingDetailText(postID: Int)
	case diggingDetailLink(postID: Int)
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
			case .appleLogin:
				return"/appleLogin"
		case .diggingDetailText:
			return "/posttext"
		case .diggingDetailLink:
			return "postlink"
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
			case.appleLogin:
				return .post
		case .diggingDetailText, .diggingDetailLink:
			return .get
		}
	}
	
	var task: Task {
		guard let parameters = parameters else { return .requestPlain }
		var body: [String: Any] = [:]
		
		switch self {
			case .createDigging:
				return .requestCompositeParameters(bodyParameters: body, bodyEncoding: parameterEncoding, urlParameters: parameters)
		case .diggingList, .diggingDetail, .totalTags, .diggingDetailText, .diggingDetailLink:
				return .requestParameters(parameters: parameters, encoding: parameterEncoding)
			case let .appleLogin(token, email):
				// TODO: 서버 요청에 따라 변경 예정 임시 바디형태처리
				body["token"] = token
				body["email"] = email
				return .requestCompositeParameters(bodyParameters: body, bodyEncoding: parameterEncoding, urlParameters: parameters)
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
			case .appleLogin:
				return parameters
		case .diggingDetailText(let postID):
			// TODO: Userdefault 활용 예정, 의견 필요 하며, 추후 헤더에 토큰 주입시 불필요하여, 고정 값 처리
			let userID = 1 //
			parameters.concat(dict: ["userid": userID, "postid": postID])
			return parameters
			
		case .diggingDetailLink(let postID):
			let userID = 1 //
			parameters.concat(dict: ["userid": userID, "postid": postID])
			return parameters
		}
	}
	
	var parameterEncoding: ParameterEncoding {
		switch self {
			case .createDigging, .appleLogin:
				return JSONEncoding.default
		case .diggingList, .diggingDetail, .totalTags, .diggingDetailText, .diggingDetailLink:
				return URLEncoding.queryString
		}
	}
}
