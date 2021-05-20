//
//  DetailFilmViewController.swift
//  SequeniaFilms
//
//  Created by OnlyFrenzy on 20.05.2021.
//

import UIKit
import Kingfisher

class DetailFilmViewController: UIViewController {
    
    @IBOutlet private weak var filmImageView: UIImageView!
    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var localNameLabel: UILabel!
    @IBOutlet private weak var ratingLabel: UILabel!
    @IBOutlet private weak var descriptionTextView: UITextView!
    
    var viewModel: DetailListViewModelProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configure()
    }
    
    private func configure() {
        if viewModel.getFilmImage() != "" {
            filmImageView.kf.setImage(with: URL(string: viewModel.getFilmImage()))
        }
        navigationItem.title = viewModel.getName()
        nameLabel.text = viewModel.getName()
        localNameLabel.text = viewModel.getLocalName()
        ratingLabel.text = String(viewModel.getRating())
        ratingLabel.textColor = ColorConfigurator().configureColorRatingLabel(rating: viewModel.getRating())
        descriptionTextView.text = viewModel.getDescription()
    }
}
