//
//  EventDetailViewController.swift
//  Woop Sicredi
//
//  Created by Jeronimo Junior on 27/10/20.
//

import UIKit

class EventDetailViewController: UIViewController {
    
    var event: Event!
    var presenter: EventPresenterInput!
    @IBOutlet weak var eventImage: UIImageView!
    @IBOutlet weak var eventDescription: UILabel!
    @IBOutlet weak var eventPrice: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        EventWireframe.setUp(vc: self)
        self.presenter.fetchEventImage(url: self.event.image)
        self.dataBind(event: self.event)
        // Do any additional setup after loading the view.
    }
    
    func dataBind(event: Event) {
        self.eventPrice.text = String(self.event.price)
        self.eventDescription.text = self.event.description
    }

}

extension EventDetailViewController: EventPresenterOutput {
    func successEvents(events: [Event]) {
       return
    }
    
    func successImage(data: Data) {
        if data == nil {
            return
        }
        let image = UIImage.init(data: data)
        self.eventImage.image = image
    }
    
    func errorEvents(message: String) {
        print(message)
    }
    
    
}
