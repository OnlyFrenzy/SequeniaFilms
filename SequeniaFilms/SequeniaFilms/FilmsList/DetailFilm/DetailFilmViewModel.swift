//
//  DetailFilmViewModel.swift
//  SequeniaFilms
//
//  Created by OnlyFrenzy on 20.05.2021.
//

import UIKit

protocol DetailListViewModelProtocol {
    
    func getName() -> String
    func getLocalName() -> String
    func getFilmImage() -> String
    func getRating() -> Double
    func getDescription() -> String
}

class DetailFilmViewModel: DetailListViewModelProtocol {
    
    private var name: String
    private var localName: String
    private var filmImage: String
    private var rating: Double
    private var description: String
    
    internal init(name: String, localName: String, filmImage: String, rating: Double, description: String) {
        self.name = name
        self.localName = localName
        self.filmImage = filmImage
        self.rating = rating
        self.description = description
    }
    
    func getName() -> String {
        return name
    }
    
    func getLocalName() -> String {
        return localName
    }
    
    func getFilmImage() -> String {
        return filmImage
    }
    
    func getRating() -> Double {
        return rating
    }
    
    func getDescription() -> String {
        return description
    }
    
}
