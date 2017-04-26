//
//  BaseRxPresenter.swift
//  videostar
//
//  Created by Marek Truszkowski on 23.02.2017.
//  Copyright © 2017 Grupa Wirtualna Polska. All rights reserved.
//

import Foundation
import UIKit
import RxSwift

let DEFAULT_NAME = "default"

class BaseRxPresenter
    <InteractorType: ViperRxInteractor, RoutingType: ViperRxRouting, ViewType: ViperRxView>
: ViperRxPresenter {

    var compositeDisposable = CompositeDisposable()

    var interactor: InteractorType?
    var routing: RoutingType?
    weak var view: ViewType?

    let name = DEFAULT_NAME
    let identifier: String = UUID().uuidString
    

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
        self.view = viperView as? ViewType
        routing?.attach(viewController: view as? UIViewController)
        interactor?.attach()
        Moviper.sharedInstance.register(presenter: self)
        if compositeDisposable.isDisposed {
            compositeDisposable = CompositeDisposable()
        }
    }

    func detach() {
        Moviper.sharedInstance.unregister(presenter: self)
        view = nil
        routing?.detach()
        interactor?.detach()
        compositeDisposable.dispose()
    }
    
    func createRouting() -> RoutingType {
        preconditionFailure("This method must be overridden")
    }

    func createInteractor() -> InteractorType {
        preconditionFailure("This method must be overridden")
    }

    func addSubscription(subscription: Disposable?) {
        guard subscription != nil else {
            return
        }
        _ = compositeDisposable.insert(subscription!)
    }
}
