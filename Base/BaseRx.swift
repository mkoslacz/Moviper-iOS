//
//  BaseRx.swift
//  videostar
//
//  Created by Grzegorz Surma on 28/04/2017.
//  Copyright © 2017 Grupa Wirtualna Polska. All rights reserved.
//


import RxSwift

class BaseRx {
    
    var compositeDisposable = CompositeDisposable()
    
    func addSubscription(subscription: Disposable?) {
        guard subscription != nil else {
            return
        }
        _ = compositeDisposable.insert(subscription!)
    }
}
