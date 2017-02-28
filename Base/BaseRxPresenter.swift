//
//  BaseRxPresenter.swift
//  videostar
//
//  Created by Marek Truszkowski on 23.02.2017.
//  Copyright © 2017 Grupa Wirtualna Polska. All rights reserved.
//

import Foundation
import UIKit

class BaseRxPresenter
    <InteractorType: ViperRxInteractor, RoutingType: ViperRxRouting, ViewType: ViperRxView>
: ViperRxPresenter {
    
    var interactor: InteractorType?
    var routing: RoutingType?
    weak var view: ViewType?
    
    init() {
        self.routing = createRouting()
        self.interactor = createInteractor()
    }

    //DI for testing purpose
    init(routing: RoutingType, interactor: InteractorType) {
        self.routing = routing
        self.interactor = interactor
    }

    func attach(viperView: ViperRxView) {
        self.view = viperView as! ViewType
        routing?.attach(viewController: view as? UIViewController)
        interactor?.attach()
    }

    func detach() {
        view = nil
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
