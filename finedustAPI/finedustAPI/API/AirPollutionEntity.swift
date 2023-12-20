//
//  AirPollutionEntity.swift
//  finedustAPI
//
//  Created by 김민솔 on 2023/12/20.
//

import Foundation

struct AirPollutionEntity: Decodable {
    //var response: AirPollutionResponse
    
}
struct AirPolltionResponse: Decodable {
    var body: ResponseBody
    var header: ResponseHeader
}
struct ResponseBody: Decodable {
    var totalCount: Int?
    var items: [PollutionData]?
    var pageNo: Int?
    var numOfRows: Int?
}
struct PollutionData: Decodable {
    
}
struct ResponseHeader: Decodable {
    var resultMsg: String?
    var resultCode: String?
}
