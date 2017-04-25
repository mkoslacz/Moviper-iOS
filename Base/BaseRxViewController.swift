//
//  BaseRxViewController.swift
//  videostar
//
//  Created by Marek Truszkowski on 22.02.2017.
//  Copyright © 2017 Grupa Wirtualna Polska. All rights reserved.
//

import UIKit

class BaseRxViewController: UIViewController, ViperRxView {

    fileprivate var presenters: [ViperRxPresenter] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        presenters = createPresenters()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        for presenter in presenters {
            presenter.attach(viperView: self)
        }
    }

    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)

        for presenter in presenters {
            presenter.detach()
        }
    }
    
    func createPresenters() -> [ViperRxPresenter] {
        preconditionFailure("This method must be overridden")
    }
}
