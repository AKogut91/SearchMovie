//
//  SearchMovideAPI.swift
//  SearchMovie
//
//  Created by AlexanderKogut on 23.04.2020.
//  Copyright © 2020 AlexanderKogut. All rights reserved.
//

import RxSwift

protocol SearchMovideAPI {
    func fetch(movie:String) -> Single<MovieModel>
}
