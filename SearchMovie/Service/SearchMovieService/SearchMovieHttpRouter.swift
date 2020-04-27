//
//  SearchMovieHttpRouter.swift
//  SearchMovie
//
//  Created by AlexanderKogut on 23.04.2020.
//  Copyright © 2020 AlexanderKogut. All rights reserved.
//

import Alamofire

enum SearchMovieHttpRouter {
    case fetch(name: String)
}

extension SearchMovieHttpRouter: HttpRouter {
    
    var baseUrl: String {
        return "http://www.omdbapi.com/"
    }

    var path: String  {
           return ""
       }

    var method: HTTPMethod {
        return .get
    }

    var headers: HTTPHeaders? {
        return nil 
    }

    var parameters: [String: String]? {
        switch self {
        case .fetch(let name):
            return ["apikey":"78c9ec59", "s": "\(name)", "page": "1"]
        }
    }
}
