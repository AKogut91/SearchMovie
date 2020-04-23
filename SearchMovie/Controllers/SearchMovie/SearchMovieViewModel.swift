//
//  SearchMovieViewModel.swift
//  SearchMovie
//
//  Created by AlexanderKogut on 4/15/20.
//  Copyright © 2020 AlexanderKogut. All rights reserved.
//

import Foundation
import RxCocoa

protocol SearchMoviePresenter: class {
    typealias Input = (
        searchText: Driver<String>, ()
    )
    typealias Output = ()
    typealias ViewModelBuilder = (SearchMoviePresenter.Input) -> SearchMoviePresenter
    
    var input: SearchMoviePresenter.Input {get}
    var output: SearchMoviePresenter.Output {get}
}

class SearchMovieViewModel: SearchMoviePresenter {
    
    var input: SearchMoviePresenter.Input
    var output: SearchMoviePresenter.Output
    
    init(input: SearchMoviePresenter.Input) {
        self.input = input
        self.output = SearchMovieViewModel.output(input: self.input)
    }
}

private extension SearchMovieViewModel {
    
    static func output(input: SearchMoviePresenter.Input) -> SearchMoviePresenter.Output {
        return()
    }
    
}
