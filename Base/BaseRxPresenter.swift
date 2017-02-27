//
//  BaseRxPresenter.swift
//  videostar
//
//  Created by Marek Truszkowski on 23.02.2017.
//  Copyright © 2017 Grupa Wirtualna Polska. All rights reserved.
//

import Foundation

class BaseRxPresenter<InteractorType: ViperRxInteractor, RoutingType: ViperRxRouting> {
    
    var interactor: InteractorType?
    var router: RoutingType?

    init(router: RoutingType, interactor: InteractorType) {
        self.router = router
        self.interactor = interactor
    }
}
