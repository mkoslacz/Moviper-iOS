//
// Created by Mateusz Koślacz on 15.03.2017.
// Copyright (c) 2017 Grupa Wirtualna Polska. All rights reserved.
//

import Foundation
import RxSwift


final class Moviper {

    let ipcConcurrentQueue = DispatchQueue(label: "IpcQueue", attributes: .concurrent)

    // Can't init the singleton
    private init() {
    }

    static let sharedInstance = Moviper()

    private var presenters = Array<BaseRxPresenter<BaseRxInteractor, BaseRxRouting, BaseRxViewController>>()

    func register(presenter: BaseRxPresenter<BaseRxInteractor, BaseRxRouting, BaseRxViewController>) {
        presenters.append(presenter)
    }

    func unregister(presenter: BaseRxPresenter<BaseRxInteractor, BaseRxRouting, BaseRxViewController>) {
        presenters.remove(object: presenter)
    }

    func getPresenters<T:ViperRxPresenter>(presenterType: T.Type) -> Observable<T> {
        return Observable.from(presenters)
                .filter { (presenter: BaseRxPresenter) in
                    type(of: presenter) == presenterType
                }
                .map { presenter in
                    presenter as! T
                }
                .subscribeOn(ConcurrentDispatchQueueScheduler(queue: ipcConcurrentQueue))
    }

    func getPresenterInstance<T:ViperRxPresenter>(presenterType: T.Type, presenterName: String) -> Maybe<T> {
        return getPresenters(presenterType: presenterType)
                .filter { (presenter: ViperRxPresenter) in
                    presenter.name == presenterName
                }
                .asMaybe()
    }

    func getPresenterInstanceOrError<T:ViperRxPresenter>(presenterType: T.Type, presenterName: String) -> Single<T> {
        return getPresenters(presenterType: presenterType)
                .filter { (presenter: ViperRxPresenter) in
                    presenter.name == presenterName
                }
                .asSingle()
    }


}

extension Array where Element: Equatable {

    // Remove first collection element that is equal to the given `object`:
    mutating func remove(object: Element) {
        if let index = index(of: object) {
            remove(at: index)
        }
    }

}


