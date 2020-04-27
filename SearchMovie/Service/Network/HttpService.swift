//
//  HttpService.swift
//  SearchMovie
//
//  Created by AlexanderKogut on 23.04.2020.
//  Copyright © 2020 AlexanderKogut. All rights reserved.
//

import Alamofire

protocol HttpService {
    var sessionManager: Session {get set}
    func reguest(_ urlRequest: URLRequestConvertible) -> DataRequest
}
