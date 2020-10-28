//
//  EventInteractor.swift
//  Woop Sicredi
//
//  Created by Jeronimo Junior on 27/10/20.
//

import Foundation

protocol EventInteractorInput: class {
    func getEvents()
    func getEventImage(url: String)
}

protocol EventInteractorOutput: class {
    func resultEvents(events: [Event])
    func successImage(data:Data)
    func failure(error: Error)
}

class EventInteractor: EventInteractorInput {
    func getEventImage(url: String) {
        self.provider.getImageFromUrl(url: url) {
            [weak self] result in
                switch result {
                case .success(let data):
                    self?.interactorOutput?.successImage(data: data)
                case .failure(let error):
                    return
                }
            
        }
    }
    
    
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
