//
//  ConfigurableHeaderProtocol.swift
//  SequeniaFilms
//
//  Created by OnlyFrenzy on 20.05.2021.
//

import UIKit

protocol ConfigurableHeaderProtocol {
    func configureWithHeaderConfigurator(model: HeaderConfiguratorProtocol) -> UITableViewHeaderFooterView
}
