//
//  BaseRxRouter.swift
//  videostar
//
//  Created by Marek Truszkowski on 27.02.2017.
//  Copyright © 2017 Grupa Wirtualna Polska. All rights reserved.
//

import Foundation
import UIKit

class BaseRxRouting: ViperRxRouting {
    
    weak var viewController: UIViewController?
    
    func attach(viewController: UIViewController?) {
        self.viewController = viewController
    }
    
    func detach() {
        self.viewController = nil
    }
}
