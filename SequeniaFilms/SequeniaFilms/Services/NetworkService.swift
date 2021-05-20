//
//  NetworkService.swift
//  SequeniaFilms
//
//  Created by OnlyFrenzy on 19.05.2021.
//

import Alamofire
import Foundation

protocol NetworkServiceProtocol {
    func requestLoad(completion: @escaping (Films?, Error?) -> Void)
}

class NetworkService: NetworkServiceProtocol {
    
    private let httpClient: HttpClient
    
    internal init(httpClient: HttpClient) {
        self.httpClient = httpClient
    }
    
    func requestLoad(completion: @escaping (Films?, Error?) -> Void) {
        guard let url = URL(string: (Router.filmsURLString.rawValue)) else { return }
        httpClient.request(url: url, decodeType: Films.self, completion: completion)
    }
}

enum Router: String {
    case filmsURLString = "https://s3-eu-west-1.amazonaws.com/sequeniatesttask/films.json"
}
