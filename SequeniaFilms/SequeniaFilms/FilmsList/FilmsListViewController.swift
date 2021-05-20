//
//  FilmsListViewController.swift
//  SequeniaFilms
//
//  Created by OnlyFrenzy on 19.05.2021.
//

import UIKit

class FilmsListViewController: UIViewController {
    
    @IBOutlet private weak var downloadView: UIView!
    @IBOutlet private weak var filmsTableView: UITableView!
    
    var viewModel: FilmsListViewModelProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel.loadFilms { dataSource in
            self.setupTableView(dataSource: dataSource)
        }
    }
    
    private func setupTableView(dataSource: FilmsListTableViewDataSource) {
        
        tableViewConfig()
        navigationItem.title = viewModel.title
        navigationItem.backButtonTitle = "Back"
        filmsTableView.dataSource = dataSource
        filmsTableView.delegate = dataSource
        filmsTableView.reloadData()
        downloadView.isHidden = true
    }
    
    private func tableViewConfig() {
        let headerNib = UINib(nibName: viewModel.headerIdentifier, bundle: nil)
        filmsTableView.register(headerNib, forHeaderFooterViewReuseIdentifier: viewModel.headerIdentifier)
        let filmCellNib = UINib(nibName: FilmCellViewController.className, bundle: nil)
        filmsTableView.register(filmCellNib, forCellReuseIdentifier: Movie.className)
    }
    
}
