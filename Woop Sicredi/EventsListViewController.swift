//
//  EventsListViewController.swift
//  Woop Sicredi
//
//  Created by Jeronimo Junior on 27/10/20.
//

import UIKit

class EventsListViewController: ViewController {

    @IBOutlet weak var tbView: UITableView!
    var eventList: [Event] = []
    var presenter: EventPresenterInput!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        EventWireframe.setUp(vc: self)
        self.tbView.delegate = self
        self.tbView.dataSource = self
        self.presenter.fetchEvents()
        // Do any additional setup after loading the view.
    }

}


extension EventsListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.eventList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "eventCell") as! EventTableViewCell
        let event = self.eventList[indexPath.row]
        cell.dataBind(event: event)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60.0
    }
    
    
}

extension EventsListViewController: EventPresenterOutput {
    func successEvents(events: [Event]) {
        self.eventList = events
        self.tbView.reloadData()
    }
    
    func errorEvents(message: String) {
        print(message)
    }
    
    
}
