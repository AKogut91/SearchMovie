//
//  SearchMovieViewModel.swift
//  SearchMovie
//
//  Created by AlexanderKogut on 4/15/20.
//  Copyright © 2020 AlexanderKogut. All rights reserved.
//

import Foundation
import RxCocoa
import RxSwift

class SearchMovieViewModel {
    
    fileprivate let searchMovieService: SearchMovideAPI
    fileprivate let searchAction:Driver<String>

    let navigationTitle: Driver<String>
    var searchResult = Observable<MovieModel>.empty()
    var movie = PublishRelay<[Search]>.init()
    
    private let bag = DisposeBag()
    
    init(searchAction:Driver<String>) {
        self.searchAction = searchAction
        self.searchMovieService = SearchMovieService()
        self.navigationTitle = Driver.just("Movie Search")
        
        searchAction
            .drive(onNext: { [weak self] result in
                self?.searchMovieService.fetch(movie: result).subscribe(onSuccess: { (movie) in
                    self!.movie.accept(movie.search ?? [Search]())
                }) { (err) in
                    Logger.Log("err -> \(err.localizedDescription)")
                }
                
            }).disposed(by: bag)
    }
}

