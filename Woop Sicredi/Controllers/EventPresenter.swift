//
//  EventPresenter.swift
//  Woop Sicredi
//
//  Created by Jeronimo Junior on 27/10/20.
//

import Foundation

protocol EventPresenterInput: class {
    func fetchEvents()
}

protocol EventPresenterOutput: class {
    func successEvents(events: [Event])
    func errorEvents(message: String)
}

class EventPresenter:EventPresenterInput, EventInteractorOutput {
    
    private var interactor: EventInteractorInput?
    private var wireframe: EventWireframe?
    
    weak var presenterOutput: EventPresenterOutput?
    
    init(wireframe: EventWireframe, interactor: EventInteractorInput) {
        self.wireframe = wireframe
        self.interactor = interactor
    }
    
    func fetchEvents() {
        self.interactor?.getEvents()
    }
    
    func resultEvents(events: [Event]) {
        self.presenterOutput?.successEvents(events: events)
    }
    
    func failure(error: Error) {
        self.presenterOutput?.errorEvents(message: error.localizedDescription)
    }
}
