//
//  HttpClient.swift
//  SequeniaFilms
//
//  Created by OnlyFrenzy on 19.05.2021.
//

import Foundation
import Alamofire

class HttpClient {
    
    func request<T: Codable> (url: URL, decodeType: T.Type, completion: @escaping (T?, Error?) -> ()) {
        let request = Session.default.request(url, method: .get) { $0.timeoutInterval = 10}
        request.responseData { (response) in
            if let data = response.data {
                do {
                    let decoder = JSONDecoder()
                    let result = try decoder.decode(T.self, from: data)
                    completion(result, nil)
                } catch let error {
                    print(error)
                    completion(nil, error)
                }
            } else {
                print("data is nil")
                completion(nil, nil)
            }
        }
        .validate()
        request.resume()
    }
}
