//
//  BaseRxViewController.swift
//  videostar
//
//  Created by Marek Truszkowski on 22.02.2017.
//  Copyright © 2017 Grupa Wirtualna Polska. All rights reserved.
//

import UIKit

class BaseRxViewController<PresenterType: ViperRxPresenter>: UIViewController {

    var presenter: PresenterType?

    override func viewDidLoad() {
        super.viewDidLoad()

        presenter?.viewIsReady()
    }
}
