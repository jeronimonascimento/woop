//
//  EventPresenter.swift
//  Woop Sicredi
//
//  Created by Jeronimo Junior on 27/10/20.
//

import Foundation

protocol EventPresenterInput: class {
    func fetchEvents()
    func fetchEventById(eventId: String)
    func fetchEventImage(url: String)
    func performCheckin(eventCheckin: EventCheckin)
}

protocol EventPresenterOutput: class {
    func successEvents(events: [Event])
    func successGetEventById(event: Event)
    func successImage(data: Data)
    func successCheckin()
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
    
    func performCheckin(eventCheckin: EventCheckin) {
        self.interactor?.checkin(eventCheckin: eventCheckin)
    }
    
    func successCheckin() {
        self.presenterOutput?.successCheckin()
    }
    
    func fetchEventImage(url: String) {
        self.interactor?.getEventImage(url: url)
    }
    
    func successImage(data: Data) {
        self.presenterOutput?.successImage(data:data)
    }
    
    func fetchEvents() {
        self.interactor?.getEvents()
    }
    
    func resultEvents(events: [Event]) {
        self.presenterOutput?.successEvents(events: events)
    }
    
    func resultGetEventById(event: Event) {
        self.presenterOutput?.successGetEventById(event: event)
    }
    
    func fetchEventById(eventId: String) {
        self.interactor?.getEventById(eventId: eventId)
    }
    
    func failure(error: Error) {
        self.presenterOutput?.errorEvents(message: error.localizedDescription)
    }
}
