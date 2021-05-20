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
        
        tableViewConfig()
        navigationItem.title = viewModel.title
        viewModel.loadFilms { dataSource in
            self.setupTableView(dataSource: dataSource)
            self.downloadView.isHidden = true
        }
    }
    
    private func setupTableView(dataSource: FilmsListTableViewDataSource) {
        
        filmsTableView.dataSource = dataSource
        filmsTableView.delegate = dataSource
        filmsTableView.reloadData()
    }
    
    private func tableViewConfig() {
        let headerNib = UINib(nibName: viewModel.headerIdentifier, bundle: nil)
        filmsTableView.register(headerNib, forHeaderFooterViewReuseIdentifier: viewModel.headerIdentifier)
        let filmCellNib = UINib(nibName: FilmTableViewCell.className, bundle: nil)
        filmsTableView.register(filmCellNib, forCellReuseIdentifier: Movie.className)
    }
}
