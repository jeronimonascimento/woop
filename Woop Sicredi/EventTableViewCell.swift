//
//  EventTableViewCell.swift
//  Woop Sicredi
//
//  Created by Jeronimo Junior on 27/10/20.
//

import UIKit

class EventTableViewCell: UITableViewCell {

    @IBOutlet weak var eventImage: UIImageView!
    @IBOutlet weak var eventTitle: UILabel!
    @IBOutlet weak var eventDate: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func dataBind(event: Event){
        self.eventTitle.text = event.title
        self.eventDate.text = String(event.date)
    }

}
