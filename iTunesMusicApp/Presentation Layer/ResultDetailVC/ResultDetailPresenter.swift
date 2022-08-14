//
//  ResultDetailPresenter.swift
//  iTunesMusicApp
//
//  Created by Suchita Bohra on 10/08/22.
//

import UIKit

protocol ResultDetailPresenter {
    func present(selectedMediaObject: Any, with entity: EntityType)
}

class ResultDetailPresenterImplementation: ResultDetailPresenter {
    var viewController: ResultDetailPresenterOutput?
    func present(selectedMediaObject: Any, with entity: EntityType) {
        self.viewController?.displayInfo(selectedMediaObject: selectedMediaObject, with: entity)
    }
}
