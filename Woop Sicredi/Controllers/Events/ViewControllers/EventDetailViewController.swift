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
        
        let button = UIButton.init(type: .custom)
        button.setImage(#imageLiteral(resourceName: "143-512"), for: UIControl.State.normal)
        button.addTarget(self, action: #selector(self.showActionSheet), for: UIControl.Event.touchUpInside)
        button.widthAnchor.constraint(equalToConstant: 20).isActive = true
        button.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        button.translatesAutoresizingMaskIntoConstraints = false

        let barButton = UIBarButtonItem(customView: button)
        //assign button to navigationbar
        self.navigationItem.rightBarButtonItem = barButton
        self.navigationItem.title = "Detalhe do evento"

  
        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "checkinSegue" {
            if let vc = segue.destination as? EventCheckinViewController {
                vc.event = sender as! Event
                vc.eventCheckinDelegate = self
            }
        }
    }
    
    func dataBind(event: Event) {
        self.eventPrice.text = String(self.event.price)
        self.eventDescription.text = self.event.description
    }
    
    @objc func showActionSheet() {
        let checkinAction = UIAlertAction(title: "Checkin",
                                          style: .default,
                                          handler: {_ in
                                            self.showCheckin()
                                          })
        let shareAction = UIAlertAction(title: "Compartilhar",
                                          style: .default,
                                          handler: {_ in
                                            self.share()
                                          })
        self.displayActionSheet(actions: [checkinAction, shareAction])
    }
    
    @objc func showCheckin() {
            self.performSegue(withIdentifier: "checkinSegue", sender: self.event)
        
    }
    
    @objc func share(){
        let firstActivityItem = "Olha que evento legal!"
        let secondActivityItem : NSURL = NSURL(string: "https://www.sicredi.com.br/site/home")!
          
          // If you want to use an image
          let image : UIImage = #imageLiteral(resourceName: "ui-image-placeholder-wireframes-apps-260nw-1037719204")
          let activityViewController : UIActivityViewController = UIActivityViewController(
              activityItems: [firstActivityItem, secondActivityItem, image], applicationActivities: nil)
          
          // This lines is for the popover you need to show in iPad
          activityViewController.popoverPresentationController?.sourceView = self.view
          
          // This line remove the arrow of the popover to show in iPad
          activityViewController.popoverPresentationController?.permittedArrowDirections = UIPopoverArrowDirection.down
          activityViewController.popoverPresentationController?.sourceRect = CGRect(x: 150, y: 150, width: 0, height: 0)
          
          // Pre-configuring activity items
          activityViewController.activityItemsConfiguration = [
          UIActivity.ActivityType.message
          ] as? UIActivityItemsConfigurationReading
          
          // Anything you want to exclude
          activityViewController.excludedActivityTypes = [
              UIActivity.ActivityType.postToWeibo,
              UIActivity.ActivityType.print,
              UIActivity.ActivityType.assignToContact,
              UIActivity.ActivityType.saveToCameraRoll,
              UIActivity.ActivityType.addToReadingList,
              UIActivity.ActivityType.postToFlickr,
              UIActivity.ActivityType.postToVimeo,
              UIActivity.ActivityType.postToTencentWeibo,
              UIActivity.ActivityType.postToFacebook
          ]
          
          activityViewController.isModalInPresentation = true
          self.present(activityViewController, animated: true, completion: nil)
    }
    
}

extension EventDetailViewController: EventPresenterOutput {
    func successGetEventById(event: Event) {
        return
    }
    
    func successCheckin() {
        return
    }
    
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

extension EventDetailViewController: EventCheckinHandler {
    func onCheckinSuccess() {
        self.showToast("Inscrição realizada com sucesso!")
    }
}
