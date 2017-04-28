//
//  BaseRxInteractor.swift
//  videostar
//
//  Created by Marek Truszkowski on 27.02.2017.
//  Copyright © 2017 Grupa Wirtualna Polska. All rights reserved.
//

import Foundation
import RxSwift

class BaseRxInteractor: ViperRxInteractor {
    
    private var compositeDisposable = CompositeDisposable()
    
    func attach() {
        
    }
    
    func detach() {
        
    }
    
    func addSubscription(subscription: Disposable?) {
        guard subscription != nil else {
            return
        }
        _ = compositeDisposable.insert(subscription!)
    }
}
