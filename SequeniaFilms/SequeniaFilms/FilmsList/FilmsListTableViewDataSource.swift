//
//  FilmsListTableViewDataSource.swift
//  SequeniaFilms
//
//  Created by OnlyFrenzy on 20.05.2021.
//

import UIKit

struct SectionModel {
    var sectionName: HeaderConfiguratorProtocol
    var sectionCells: [CellConfiguratorProtocol]
    var sectionStage: Bool

    internal init(sectionName: HeaderConfiguratorProtocol, sectionCells: [CellConfiguratorProtocol]) {
        self.sectionName = sectionName
        self.sectionCells = sectionCells
        sectionStage = true
    }
}

class FilmsListTableViewDataSource: NSObject {
    private var models: [SectionModel]
    private var headerID: String

    internal init(models: [SectionModel], headerID: String) {
        self.models = models
        self.headerID = headerID
    }
}

extension FilmsListTableViewDataSource: UITableViewDataSource {
    
    func numberOfSections(in _: UITableView) -> Int {
        return models.count
    }
    
    func tableView(_: UITableView, numberOfRowsInSection section: Int) -> Int {
        if models[section].sectionStage {
            return models[section].sectionCells.count
        } else {
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let model = models[indexPath.section].sectionCells[indexPath.row]
        if let cell = tableView.dequeueReusableCell(withIdentifier: model.cellIdentifier) as? ConfigurableCellProtocol {
            return cell.configureWithCellConfigurator(model: model)
        }
        return UITableViewCell()
    }
}

extension FilmsListTableViewDataSource: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 70
    }
    
    func tableView(_: UITableView, heightForRowAt _: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let model = models[section].sectionName
        if let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: headerID) as? ConfigurableHeaderProtocol {
            return header.configureWithHeaderConfigurator(model: model)
        }
        return UITableViewHeaderFooterView()
    }
    
    func tableView(_: UITableView, didSelectRowAt indexPath: IndexPath) {
        let model = models[indexPath.section].sectionCells[indexPath.row]
        model.selectionClosure?()
    }
}

