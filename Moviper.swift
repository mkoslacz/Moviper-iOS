//
// Created by Mateusz Koślacz on 15.03.2017.
// Copyright (c) 2017 Grupa Wirtualna Polska. All rights reserved.
//

import Foundation
import RxSwift

final class Moviper {

    static let sharedInstance = Moviper()
    private init() {}

    let ipcConcurrentQueue = DispatchQueue(label: "IpcQueue", attributes: .concurrent)

    var presenters = [ViperRxPresenter]() //TODO: write and implement thread-safe array

    func register(presenter: ViperRxPresenter) {
        
        //W singletonie trzeba dodawać do array w kolejce serial
        presenters.append(presenter)
    }

    func unregister(presenter: ViperRxPresenter) {
        let index =  presenters.index { (containedPresenter) -> Bool in
            containedPresenter.identifier == presenter.identifier 
        }

        if let index = index {
            presenters.remove(at: index)
        }
    }

    func getPresenters<T: ViperRxPresenter>(presenterType: T.Type) -> Observable<T> {
        return Observable.from(presenters)
            .filter { (presenter: ViperRxPresenter) in
                type(of: presenter) == presenterType
            }
            .map { presenter in
                return presenter as! T
            }
            .subscribeOn(ConcurrentDispatchQueueScheduler(queue: ipcConcurrentQueue))
    }

    func getPresenterInstance<T: ViperRxPresenter>(presenterType: T.Type, presenterName: String) -> Maybe<T> {
        return getPresenters(presenterType: presenterType)
            .filter { (presenter: ViperRxPresenter) in
                presenter.name == presenterName
            }
            .asMaybe()
    }

    func getPresenterInstanceOrError<T: ViperRxPresenter>(presenterType: T.Type, presenterName: String) -> Single<T> {
        return getPresenters(presenterType: presenterType)
            .filter { (presenter: ViperRxPresenter) in
                presenter.name == presenterName
            }
            .asSingle()
    }
}
