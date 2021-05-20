//
//  DefaultCoordinator.swift
//  SequeniaFilms
//
//  Created by OnlyFrenzy on 19.05.2021.
//

import UIKit

class DefaultCoordinator: Coordinator {
    
    private let storyboard = UIStoryboard(name: "Main", bundle: nil)
    private let navigationController: UINavigationController
    private let networkService: NetworkService
    
    required init(navigationController: UINavigationController) {
        self.navigationController = navigationController
        self.networkService = NetworkService(httpClient: HttpClient())
    }
    
    func start() {
        guard let viewController = storyboard.instantiateViewController(identifier: FilmsListViewController.className) as? FilmsListViewController else { assertionFailure("FilmsListViewController is nil"); return }
        
        let viewModel = FilmsListViewModel(networkService: networkService) { (imageURL, name, localName, rating, description) in
            self.pushDetailViewController(imageURL: imageURL, name: name, localName: localName, rating: rating, description: description)
        } pushBadServerHandler: {
            self.pushBadServerViewController()
        } pushNoInternetHandler: {
            self.pushNoInternetViewController()
        }

        viewController.viewModel = viewModel
        navigationController.pushViewController(viewController, animated: false)
    }
    
    func pushDetailViewController(imageURL: String,
                                  name: String,
                                  localName: String,
                                  rating: Double,
                                  description: String) {
        guard let detailViewController = storyboard.instantiateViewController(identifier: DetailFilmViewController.className) as? DetailFilmViewController else { assertionFailure("DetailFilmViewController is nil"); return }
        let detailViewModel = DetailFilmViewModel(name: name,
                                                  localName: localName,
                                                  filmImage: imageURL,
                                                  rating: rating,
                                                  description: description)

        detailViewController.viewModel = detailViewModel

        navigationController.pushViewController(detailViewController, animated: true)
    }
    
    func pushBadServerViewController() {
        guard let badServerViewController = storyboard.instantiateViewController(identifier: BadServerViewController.className) as? BadServerViewController else { assertionFailure("BadServerViewController is nil"); return  }
        navigationController.pushViewController(badServerViewController, animated: true)
    }
    
    func pushNoInternetViewController() {
        guard let noInternetViewController = storyboard.instantiateViewController(identifier: NoInternetViewController.className) as? NoInternetViewController else { assertionFailure("NoInternetViewController is nil"); return  }
        navigationController.pushViewController(noInternetViewController, animated: true)
    }
}
