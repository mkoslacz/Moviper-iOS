//
//  BaseRxRoutingInterface.swift
//  videostar
//
//  Created by Marek Truszkowski on 24.02.2017.
//  Copyright © 2017 Grupa Wirtualna Polska. All rights reserved.
//

import Foundation
import UIKit

protocol ViperRxRouting {

    func attach(viewController: UIViewController?)
    
    func detach()
}
