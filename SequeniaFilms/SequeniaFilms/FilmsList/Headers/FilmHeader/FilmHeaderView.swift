//
//  FilmHeaderView.swift
//  SequeniaFilms
//
//  Created by OnlyFrenzy on 20.05.2021.
//

import UIKit

class FilmHeaderView: UITableViewHeaderFooterView, ConfigurableHeaderProtocol {
    
    @IBOutlet private weak var titleLabel: UILabel!

    func configureWithHeaderConfigurator(model: HeaderConfiguratorProtocol) -> UITableViewHeaderFooterView {
        titleLabel.text = model.headerTitle
        return self
    }
}

struct Header: HeaderConfiguratorProtocol {
    var headerTitle: String
}
