//
//  ViewController.swift
//  SearchMovie
//
//  Created by AlexanderKogut on 4/15/20.
//  Copyright © 2020 AlexanderKogut. All rights reserved.
//

import UIKit
import RxSwift
import RxDataSources

class SearchMovieViewController: UIViewController, Storyboarded {

    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    
    private var viewModel: SearchMoviePresenter!
    var viewModelBuilder: SearchMoviePresenter.ViewModelBuilder!
     
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel = viewModelBuilder((
            searchBar.rx.text.orEmpty.asDriver(),()
        )) 
    }
}

