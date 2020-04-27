//
//  RequesterService.swift
//  SearchMovie
//
//  Created by AlexanderKogut on 23.04.2020.
//  Copyright © 2020 AlexanderKogut. All rights reserved.
//

import Alamofire

class RequesterService: HttpService {
    
    var sessionManager: Session = .default
    
    func reguest(_ urlRequest: URLRequestConvertible) -> DataRequest {
        return sessionManager.request(urlRequest).validate(statusCode: 200..<400)
    }
    
}
