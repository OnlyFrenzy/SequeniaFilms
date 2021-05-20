//
//  CellConfiguratorProtocol.swift
//  SequeniaFilms
//
//  Created by OnlyFrenzy on 20.05.2021.
//

import Foundation

protocol CellConfiguratorProtocol: NSObject {
    var cellIdentifier: String { get }
    var selectionClosure: (() -> Void)? { get set }
}

extension CellConfiguratorProtocol {
    var cellIdentifier: String {
        return Self.className
    }
}
