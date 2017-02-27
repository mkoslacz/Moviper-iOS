//
//  BaseRxViewController.swift
//  videostar
//
//  Created by Marek Truszkowski on 22.02.2017.
//  Copyright © 2017 Grupa Wirtualna Polska. All rights reserved.
//

import UIKit

class BaseRxViewController: UIViewController, ViperRxView {

    var presenter: ViperRxPresenter?

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter = createPresenter()
        presenter?.attach(view: self)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        presenter?.detach()
    }
    
    func createPresenter() -> ViperRxPresenter {
        preconditionFailure("This method must be overridden")
    }
}
