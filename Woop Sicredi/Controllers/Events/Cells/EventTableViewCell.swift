//
//  EventTableViewCell.swift
//  Woop Sicredi
//
//  Created by Jeronimo Junior on 27/10/20.
//

import UIKit

class EventTableViewCell: UITableViewCell {

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
        let dateFormatterPrint = DateFormatter()
        dateFormatterPrint.dateFormat = "dd/MM/yyyy"

        let date = Date.init(timeIntervalSince1970: TimeInterval(event.date))
        let formattedDate = dateFormatterPrint.string(from: date)
        self.eventDate.text = formattedDate
        
        //self.eventDate.text = String(dateFormatterPrint.date(from: date))
        //self.eventImage.image = 
    }

}
