//
//  FinedustRequest.swift
//  finedustAPI
//
//  Created by 김민솔 on 2023/12/20.
//

import Alamofire
import UIKit

class FinddustRequest {
    
    func getAirPollutionData(_ viewController: ViewController) {
        let url = "https://apis.data.go.kr/B552584/ArpltnInforInqireSvc/getCtprvnRltmMesureDnsty"
        let params: Parameters = [
            "serviceKey": "e2WJiKB0Zhb4oxjk3IN43CUw3N5rEJ6DzJ%2BxpJ6RGOCbEwyHwgvI6R4A85qFfJLFy7vd%2BlLFzYZD9lxG2USsmQ%3D%3D",
            "returnType": "json",
            "numOfRows":"1",
            "pageNo" : "1",
            "stationName" : "종로구",
            "dataTerm" : "DAILY",
            "ver": "1.0"
            ]
//        AF.reqeust(url,
//                   method: .get,
//                   parameters: params)
//        .responseDecodable(of: AirPollutionEntity.self) {
//            response in
//            switch response.result {
//            case .success(let response):
//                //viewController.didAirPol
//            }
//            case .failure(let error):
//            print(error.localizedDescription)
//        }
        
        
        
    }
}
