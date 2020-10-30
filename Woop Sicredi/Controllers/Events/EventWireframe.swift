//
//  EventWireframe.swift
//  Woop Sicredi
//
//  Created by Jeronimo Junior on 27/10/20.
//

import Foundation

class EventWireframe {
    
    var presenter: EventPresenter?
    
    static func setUp(vc: EventsListViewController){
        let interactor = EventInteractor()
        let wireframe  = EventWireframe()
        let presenter  = EventPresenter(wireframe: wireframe, interactor: interactor)

        vc.presenter = presenter
        interactor.interactorOutput = presenter
        presenter.presenterOutput = vc

    }
    
    static func setUp(vc: EventDetailViewController){
        let interactor = EventInteractor()
        let wireframe  = EventWireframe()
        let presenter  = EventPresenter(wireframe: wireframe, interactor: interactor)

        vc.presenter = presenter
        interactor.interactorOutput = presenter
        presenter.presenterOutput = vc

    }
    
    static func setUp(vc: EventCheckinViewController){
        let interactor = EventInteractor()
        let wireframe  = EventWireframe()
        let presenter  = EventPresenter(wireframe: wireframe, interactor: interactor)

        vc.presenter = presenter
        interactor.interactorOutput = presenter
        presenter.presenterOutput = vc

    }
}
