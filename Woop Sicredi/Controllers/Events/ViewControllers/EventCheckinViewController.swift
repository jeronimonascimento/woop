//
//  EventCheckinViewController.swift
//  Woop Sicredi
//
//  Created by Jeronimo Junior on 29/10/20.
//

import UIKit

protocol EventCheckinHandler: class {
    func onCheckinSuccess()
}

class EventCheckinViewController: UIViewController {

    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var email: UITextField!
    var presenter: EventPresenterInput!
    var event: Event!
    
    var eventCheckinDelegate: EventCheckinHandler!
    override func viewDidLoad() {
        super.viewDidLoad()
        EventWireframe.setUp(vc: self)

        // Do any additional setup after loading the view.
    }
    
    @IBAction func performCheckin(_ sender: Any) {
        var eventCheckin = EventCheckin(eventId: self.event.id, name: self.name.text!, email: self.email.text!)
        self.presenter.performCheckin(eventCheckin: eventCheckin)
    }
   

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension EventCheckinViewController: EventPresenterOutput {
    func successGetEventById(event: Event) {
        self.dismiss(animated: true) {
            self.eventCheckinDelegate.onCheckinSuccess()
        }
    }
    
    func successCheckin() {
        self.presenter.fetchEventById(eventId: self.event.id)
    }
    
    func successEvents(events: [Event]) {
        return
    }
    
    func successImage(data: Data) {
        return
    }
    
    func errorEvents(message: String) {
        print(message)
    }
    
}
