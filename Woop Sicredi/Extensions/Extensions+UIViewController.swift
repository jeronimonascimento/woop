//
//  Extensions+UIViewController.swift
//  Woop Sicredi
//
//  Created by Jeronimo Junior on 29/10/20.
//

import Foundation
import UIKit

extension UIViewController {
    
    
    class ToastLabel: UILabel {
        var textInsets = UIEdgeInsets.zero {
            didSet { invalidateIntrinsicContentSize() }
        }
        
        override func textRect(forBounds bounds: CGRect, limitedToNumberOfLines numberOfLines: Int) -> CGRect {
            let insetRect = bounds.inset(by: textInsets)
            let textRect = super.textRect(forBounds: insetRect, limitedToNumberOfLines: numberOfLines)
            let invertedInsets = UIEdgeInsets(top: -textInsets.top, left: -textInsets.left, bottom: -textInsets.bottom, right: -textInsets.right)
            
            return textRect.inset(by: invertedInsets)
        }
        
        override func drawText(in rect: CGRect) {
            super.drawText(in: rect.inset(by: textInsets))
        }
    }
    
    
    @objc func displayActionSheet(actions: [UIAlertAction]) {
       
       let optionMenu = UIAlertController(title: nil, message: "Selecione uma opção", preferredStyle: .actionSheet)
        actions.forEach { (action) in
            optionMenu.addAction(action)
        }
        
       let cancelAction = UIAlertAction(title: NSLocalizedString("CANCEL", comment: ""), style: .cancel)
       optionMenu.addAction(cancelAction)
       self.present(optionMenu, animated: true, completion: nil)
   }
    
    func showToast(_ text: String, delay: TimeInterval = 3.0) {
       
       let visibleToasts = self.view.subviews.filter { subview in
           return subview.tag == 1001
       }
       
       let label = self.setupLabel(text: text)
       view.addSubview(label)
       
       let saveArea = view.safeAreaLayoutGuide
       label.centerXAnchor.constraint(equalTo: saveArea.centerXAnchor, constant: 0).isActive = true
       label.leadingAnchor.constraint(greaterThanOrEqualTo: saveArea.leadingAnchor, constant: 15).isActive = true
       label.trailingAnchor.constraint(lessThanOrEqualTo: saveArea.trailingAnchor, constant: -15).isActive = true
       
       let bottomAnchorValue = CGFloat( visibleToasts.count == 0 ? -30 : visibleToasts.count * -70)
       label.bottomAnchor.constraint(equalTo: saveArea.bottomAnchor, constant: bottomAnchorValue).isActive = true
       
       UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseIn, animations: {
           label.alpha = 1
       }, completion: { _ in
           UIView.animate(withDuration: 0.5, delay: delay, options: .curveEaseOut, animations: {
               label.alpha = 0
           }, completion: {_ in
               label.removeFromSuperview()
           })
       })
   }
    
    private func setupLabel(text: String) -> ToastLabel {
        let label = ToastLabel()
        label.tag = 1001
        label.backgroundColor = .gray
        label.textColor = .white
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 15)
        label.alpha = 0
        label.text = text
        label.clipsToBounds = true
        label.layer.cornerRadius = 20
        label.numberOfLines = 0
        label.textInsets = UIEdgeInsets(top: 10, left: 15, bottom: 10, right: 15)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }
}
