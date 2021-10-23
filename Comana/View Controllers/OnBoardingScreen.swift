//
//  OnBoardingScreen.swift
//  Comana
//
//  Created by Tudor Croitoru on 16/10/2021.
//

import UIKit
import Lottie
import CoreLocation

class OnBoardingScreen: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var animationView: AnimationView!
    @IBOutlet weak var idLabel: UILabel!
    @IBOutlet weak var userNameLabel: UILabel!
    
    
    public let userModel = UserModel.shared
    
    @IBAction func doneOnboarding(_ sender: Any) {
        self.dismiss(animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        animationView.loopMode = .loop
        animationView.animationSpeed = 1.0
        animationView.play()
        
        idLabel.text = userModel.getIdentifier().uuidString
        userNameLabel.text = userModel.userName
        
        
        
    }

    
}
