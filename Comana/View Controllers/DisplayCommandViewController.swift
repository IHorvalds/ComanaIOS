//
//  DisplayCommandViewController.swift
//  Comana
//
//  Created by Tudor Croitoru on 23/10/2021.
//

import UIKit

class DisplayCommandViewController: UIViewController {
    
    @IBOutlet private weak var commandImage: UIImageView!
    @IBOutlet private weak var commandText: UILabel!
    @IBOutlet private weak var acknowledgedLabel: UILabel!
    @IBOutlet weak var trackView: UIView!
    
    
    public var image: UIImage! = nil
    public var tint: UIColor! = nil
    public var command: String! = nil
    public var acknowledge: String! = nil
    
    let timeoutView = UIView()
    
    //TODO: Make a way to update the acknowledgedLabel count.
    //Requirement: acutally communicate with backend service
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        commandImage.tintColor = tint
        commandImage.image = image
        commandText.text = command
        acknowledgedLabel.text = acknowledge
        
        timeoutView.frame = CGRect(origin: .zero,
                                   size: CGSize(width: 0.0001,
                                                height: trackView.bounds.height)
                            )
        timeoutView.backgroundColor = .systemBlue
        trackView.addSubview(timeoutView)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        UIView.animate(withDuration: 5.0,
                       delay: 0.0,
                       options: .curveLinear) { [weak self] in
            guard let self = self else { return }
            
            self.timeoutView.frame = CGRect(origin: .zero,
                                            size: CGSize(width: self.trackView.bounds.width,
                                                         height: self.trackView.bounds.height))
        } completion: { [weak self] _ in
            guard let self = self else { return }
            self.dismiss(animated: true)
        }
    }

}
