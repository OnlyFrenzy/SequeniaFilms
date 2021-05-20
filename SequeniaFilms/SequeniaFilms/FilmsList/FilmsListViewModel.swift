//
//  FilmsListViewModel.swift
//  SequeniaFilms
//
//  Created by OnlyFrenzy on 19.05.2021.
//

import Foundation

protocol FilmsListViewModelProtocol {
    func loadFilms(completion: @escaping (FilmsListTableViewDataSource) -> Void)
    var headerIdentifier: String { get }
    var title: String { get }
}

class FilmsListViewModel: FilmsListViewModelProtocol {
    
    let headerIdentifier = String(describing: FilmHeaderView.self)
    var title: String = "Films"
    private let networkService: NetworkServiceProtocol
    private var dataSource: FilmsListTableViewDataSource!
    private var films: [Film] = []
    private var pushDetailsHandler: ((String, String, String, Double, String) -> ())?
    private var pushBadServerHandler: (()->())?
    private var pushNoInternetHandler: (()->())?
    
    internal init(networkService: NetworkServiceProtocol,
                  pushDetailsHandler: ((String, String, String, Double, String) -> ())? = nil,
                  pushBadServerHandler: (() -> ())? = nil,
                  pushNoInternetHandler: (() -> ())? = nil) {
        self.networkService = networkService
        self.pushDetailsHandler = pushDetailsHandler
        self.pushBadServerHandler = pushBadServerHandler
        self.pushNoInternetHandler = pushNoInternetHandler
    }
    
    func loadFilms(completion: @escaping (FilmsListTableViewDataSource) -> Void) {
        
        networkService.requestLoad( completion: { films, error  in
            if let films = films {
                self.films = films.films ?? []
                let models = self.configureFilmsModels()
                self.dataSource = FilmsListTableViewDataSource(models: models, headerID: self.headerIdentifier)
                completion(self.dataSource)
            }
            if error != nil {
                self.pushBadServerHandler?()
            }
            if films == nil && error == nil {
                self.pushNoInternetHandler?()
            }
        })
    }
    
    private func configureFilmsModels() -> [SectionModel] {

        var filmsModels: [SectionModel] = []
        let sortingYears = sortingYearsArray()
        
        for index in 0 ..< sortingYears.count {
            let sectionFilms = configureSectionModels(year: sortingYears[index])
            filmsModels.append(SectionModel(sectionName: Header(headerTitle: String(sortingYears[index])), sectionCells: sectionFilms))
        }
        return filmsModels
    }
    
    private func configureSectionModels(year: Int) -> [CellConfiguratorProtocol] {
        
        var sectionFilms: [CellConfiguratorProtocol] = []
        
        for index in 0 ..< films.count {
            
            if films[index].year == year {
                
                let film = Movie(name: films[index].name ?? "",
                                 localName: films[index].localizedName ?? "",
                                 rating: films[index].rating ?? 0.000,
                                 imageURL: films[index].imageURL ?? "",
                                 filmDescription: films[index].filmDescription ?? "No Description")
                film.selectionClosure = { [weak self] in
                    self?.pushDetailsHandler?(film.imageURL, film.name, film.localName, film.rating, film.filmDescription)
                }
                sectionFilms.append(film)
            }
        }
        return sectionFilms
    }
    
    private func sortingYearsArray() -> [Int] {
        
        var years = Set<Int>()
        for index in 0 ..< films.count {
            years.insert(films[index].year ?? 0)
        }
        return Array(years).sorted(by: <)
    }
}
