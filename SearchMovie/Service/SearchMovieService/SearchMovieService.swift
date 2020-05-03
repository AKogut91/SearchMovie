//
//  SearchMovieService.swift
//  SearchMovie
//
//  Created by AlexanderKogut on 23.04.2020.
//  Copyright © 2020 AlexanderKogut. All rights reserved.
//

import Foundation
import RxSwift

class SearchMovieService {
    private lazy var httpService = RequesterService()
    static let shated = SearchMovieService()
    
}

extension SearchMovieService: SearchMovideAPI {
    
    func fetch(movie: String) -> Single<MovieModel> {
        return Single.create { [httpService] (single) -> Disposable in
            do {
                try SearchMovieHttpRouter
                    .fetch(name: movie)
                    .request(usingHttpService: httpService)
                    .responseJSON { (result) in
                        guard let data = result.data else { return }
                        Logger.Log("data count -> \(data.count)")
                        do {
                            let movie = try JSONDecoder().decode(MovieModel.self, from: data)
                            single(.success(movie))
                        } catch let error as NSError {
                            Logger.Log("error = \(error.localizedDescription)")
                        }
                }
            } catch let error as NSError {
                Logger.Log("error = \(error.localizedDescription)")
            }
            return Disposables.create()
        }
    }
}
