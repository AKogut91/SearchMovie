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

final class SearchMovieViewController: UIViewController, Storyboarded {
    
    @IBOutlet weak private var searchBar: UISearchBar!
    @IBOutlet weak private var tableView: UITableView!
    @IBOutlet weak private var alerLabel: UILabel!
    
    private let disposeBag = DisposeBag()
    private var viewModel: SearchMovieViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setViewModel()
        registeCell()
        setTableView()
    }
    
    //MARK: - ViewModel
    
    fileprivate func setViewModel() {
        viewModel = SearchMovieViewModel(searchAction: searchBar.rx.text.orEmpty.asDriver())
        viewModel.navigationTitle.drive(self.navigationItem.rx.title).disposed(by: disposeBag)
        
        viewModel.movie.subscribe(onNext: { [weak self]  movies in
            self?.alerLabel.isHidden = true
            if movies.isEmpty {
                self?.alerLabel.isHidden = false
                self?.alerLabel.text = "Nothing found"
            }
        }).disposed(by: disposeBag)
    }
    
    //MARK: - TableView
    
    fileprivate func registeCell() {
        tableView.registerCell(MovieTableViewCell.self)
    }
    
    fileprivate func setTableView() {
        tableView.keyboardDismissMode = .onDrag
        tableView.separatorStyle = .none
        viewModel.movie.bind(to: tableView.rx.items) { (tableView, row, element) in
            let cell : MovieTableViewCell = tableView.dequeueReusableCell(forIndexPath: IndexPath(row: row, section: 0))
            cell.configure(movie: element)
            return cell
        }.disposed(by: disposeBag)
    }
}


