//
//  EventInteractor.swift
//  Woop Sicredi
//
//  Created by Jeronimo Junior on 27/10/20.
//

import Foundation

protocol EventInteractorInput: class {
    func getEvents()
    func getEventById(eventId: String)
    func getEventImage(url: String)
    func checkin(eventCheckin: EventCheckin)
}

protocol EventInteractorOutput: class {
    func resultEvents(events: [Event])
    func resultGetEventById(event: Event)
    func successImage(data:Data)
    func successCheckin()
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
    
    func getEventById(eventId: String) {
        self.provider.getEventById(eventId: eventId) {
            [weak self] result in
            switch result {
            case .success(let event):
                self?.interactorOutput?.resultGetEventById(event: event)
            case .failure(let error):
                self?.interactorOutput?.failure(error: error)
            }
        }
    }
    
    func checkin(eventCheckin: EventCheckin) {
        self.provider.checkin(eventCheckin: eventCheckin) {
            [weak self] result in
            switch result {
            case .success(let string):
                self?.interactorOutput?.successCheckin()
            case .failure(let error):
                self?.interactorOutput?.failure(error: error)
            }
        }
    }
    
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
}
