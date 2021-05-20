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
    
    private func pushDetailViewController(imageURL: String,
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
    
    private func pushBadServerViewController() {
        let alertVC = UIAlertController(
            title: "Error",
            message: "Error connecting to the server",
            preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertVC.addAction(action)
        navigationController.present(alertVC, animated: true, completion: nil)
    }
    
    private func pushNoInternetViewController() {
        let alertVC = UIAlertController(
            title: "Error",
            message: "No internet",
            preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertVC.addAction(action)
        navigationController.present(alertVC, animated: true, completion: nil)
    }
}
