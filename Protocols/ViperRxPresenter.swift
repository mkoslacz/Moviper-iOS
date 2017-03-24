//
//  BaseRxPresenter.swift
//  videostar
//
//  Created by Marek Truszkowski on 22.02.2017.
//  Copyright © 2017 Grupa Wirtualna Polska. All rights reserved.
//

import Foundation

protocol ViperRxPresenter {

    var name: String { get }

    var identifier: String { get }

    func attach(viperView: ViperRxView)

    func detach()
}
