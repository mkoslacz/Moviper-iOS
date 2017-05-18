//
//  BaseRxViewController.swift
//  videostar
//
//  Created by Marek Truszkowski on 22.02.2017.
//  Copyright © 2017 Grupa Wirtualna Polska. All rights reserved.
//

import UIKit
import RxSwift

class BaseRxViewController: UIViewController, ViperRxView {

    private var compositeDisposable = CompositeDisposable()
    fileprivate var presenters: [ViperRxPresenter] = []
    private var isAttached = false


    override func viewDidLoad() {
        super.viewDidLoad()

        presenters = createPresenters()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        attach()
    }

    func attach() {
        guard !isAttached else {
            return
        }
        isAttached = true
        for presenter in presenters {
            presenter.attach(viperView: self)
        }
    }

    func detach() {
        isAttached = false
        for presenter in presenters {
            presenter.detach()
        }
    }

    deinit {
        detach()
        compositeDisposable.dispose()
    }
    
    func createPresenters() -> [ViperRxPresenter] {
        preconditionFailure("This method must be overridden")
    }
    
    func addSubscription(subscription: Disposable?) {
        if let subscription = subscription {
            _ = compositeDisposable.insert(subscription)
        }
    }
}
