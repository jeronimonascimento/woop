//
//  Extensions+UIViewController.swift
//  Woop Sicredi
//
//  Created by Jeronimo Junior on 29/10/20.
//

import Foundation
import UIKit

extension UIViewController {
    @objc func displayActionSheet(actions: [UIAlertAction]) {
       
       let optionMenu = UIAlertController(title: nil, message: "Selecione uma opção", preferredStyle: .actionSheet)
        actions.forEach { (action) in
            optionMenu.addAction(action)
        }
        
       let cancelAction = UIAlertAction(title: NSLocalizedString("CANCEL", comment: ""), style: .cancel)
       optionMenu.addAction(cancelAction)
       self.present(optionMenu, animated: true, completion: nil)
   }
}
