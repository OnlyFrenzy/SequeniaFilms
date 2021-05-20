//
//  ConfigurableCellProtocol.swift
//  SequeniaFilms
//
//  Created by OnlyFrenzy on 20.05.2021.
//

import UIKit

protocol ConfigurableCellProtocol {
    func configureWithCellConfigurator(model: CellConfiguratorProtocol) -> UITableViewCell
}
