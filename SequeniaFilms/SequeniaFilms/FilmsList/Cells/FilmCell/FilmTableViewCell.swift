//
//  FilmTableViewCell.swift
//  SequeniaFilms
//
//  Created by OnlyFrenzy on 19.05.2021.
//

import UIKit

class FilmTableViewCell: UITableViewCell, ConfigurableCellProtocol {
    
    @IBOutlet private weak var localNameLabel: UILabel!
    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var ratingLabel: UILabel!
    
    func configureWithCellConfigurator(model: CellConfiguratorProtocol) -> UITableViewCell {
        guard let movieModel = model as? Movie else { return self }
        localNameLabel.text = movieModel.name
        nameLabel.text = movieModel.localName
        ratingLabel.text = String(movieModel.rating)
        ratingLabel.textColor = ColorConfigurator.configureColorRatingLabel(rating: movieModel.rating)
        return self
    }
}

class Movie: NSObject, CellConfiguratorProtocol {
    
    var name: String
    var localName: String
    var rating: Double
    var imageURL: String
    var filmDescription: String
    
    var selectionClosure: (() -> Void)?
    
    init(name: String, localName: String, rating: Double, imageURL: String, filmDescription: String) {
        self.name = name
        self.localName = localName
        self.rating = rating
        self.imageURL = imageURL
        self.filmDescription = filmDescription
    }
}
