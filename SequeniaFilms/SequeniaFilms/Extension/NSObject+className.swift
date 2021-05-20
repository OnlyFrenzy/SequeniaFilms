//
//  NSObject+className.swift
//  SequeniaFilms
//
//  Created by OnlyFrenzy on 20.05.2021.
//

import Foundation

extension NSObject {
    static var className: String {
        String(describing: Self.self)
    }
}
