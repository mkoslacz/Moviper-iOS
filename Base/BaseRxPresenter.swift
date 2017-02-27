//
//  BaseRxPresenter.swift
//  videostar
//
//  Created by Marek Truszkowski on 23.02.2017.
//  Copyright © 2017 Grupa Wirtualna Polska. All rights reserved.
//

import Foundation

class BaseRxPresenter
    <InteractorType: ViperRxInteractor, RoutingType: ViperRxRouting, ViewType: ViperRxView>
: ViperRxPresenter {
    
    var interactor: InteractorType?
    var routing: RoutingType?
    var view: ViewType?
    
    init() {
        self.routing = createRouting()
        self.interactor = createInteractor()
    }
    
    func attach(view: ViperRxView) {
        self.view = view as! ViewType
        routing?.attach()
        interactor?.attach()
    }
    
    func detach() {
        routing?.detach()
        interactor?.detach()
    }
    
    func createRouting() -> RoutingType {
        preconditionFailure("This method must be overridden")
    }
    
    func createInteractor() -> InteractorType {
        preconditionFailure("This method must be overridden")
    }
}
