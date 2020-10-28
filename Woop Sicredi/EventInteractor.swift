//
//  EventInteractor.swift
//  Woop Sicredi
//
//  Created by Jeronimo Junior on 27/10/20.
//

import Foundation

protocol EventInteractorInput: class {
    func getEvents()
}

protocol EventInteractorOutput: class {
    func resultEvents(events: [Event])
    func failure(error: Error)
}

class EventInteractor: EventInteractorInput {
    
    var interactorOutput: EventInteractorOutput?
    
    lazy var provider: EventService = {
        return EventService()
    }()
    
    func getEvents() {
        self.provider.getEvents() {
            [weak self] result in
            switch result {
            case .success(let events):
                self?.interactorOutput?.resultEvents(events: events)
            case .failure(let error):
                self?.interactorOutput?.failure(error: error)
            }
        }
    }
}
