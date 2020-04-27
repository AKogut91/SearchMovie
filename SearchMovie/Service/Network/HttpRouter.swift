//
//  HttpRouter.swift
//  SearchMovie
//
//  Created by AlexanderKogut on 23.04.2020.
//  Copyright © 2020 AlexanderKogut. All rights reserved.
//

import Foundation
import Alamofire

protocol HttpRouter {
    var baseUrl: String {get}
    var path: String {get}
    var method: HTTPMethod {get}
    var headers: HTTPHeaders? {get}
    var parameters: [String: String]? {get}
    
    func body() throws -> Data?
    func request(usingHttpService service: HttpService) throws -> DataRequest
}
extension HttpRouter {
    
    var parameters: Parameters? { return nil}
    var headers: HTTPHeaders? { return nil}
    
    func body() throws -> Data? {return nil}
    
    func asUrlRequest() throws -> URLRequest {
        var components = URLComponents(string: baseUrl)!        
        if let params = parameters {
            components.queryItems = params.map { (key, value) in
                URLQueryItem(name: key, value: value)
            }
        }
        components.percentEncodedQuery = components.percentEncodedQuery?.replacingOccurrences(of: "+", with: "%2B")
        let request = try URLRequest(url: components.asURL(), method: method, headers: headers)
        Logger.Log("request  url -> \(String(describing: request.url?.absoluteString)) \n query -> \(components.query ?? "")")
        return request
    }
    
    func request(usingHttpService service: HttpService) throws -> DataRequest {
        return try service.reguest(asUrlRequest())
    }
}

