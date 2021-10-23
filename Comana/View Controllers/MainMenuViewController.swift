//
//  ViewController.swift
//  Comana
//
//  Created by Tudor Croitoru on 14/10/2021.
//

import UIKit

class MainMenuViewController: UIViewController {
    
    @IBOutlet weak var userNameButton: UIButton!

    @IBOutlet var collectionView: UICollectionView!
    @IBOutlet weak var commandHeightMenuConstraint: NSLayoutConstraint!
    @IBOutlet weak var higherMenuHeightConstraint: NSLayoutConstraint!
    
    private var dataSource: CommandDataSource!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dataSource = CommandDataSource(collectionView: collectionView, cellProvider: {
            collectionView, index, item  in
            return self.buildCell(in: collectionView, for: index, with: item)
        })
        
        getSnapshot()
        collectionView.delegate = self
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        if UserDefaultsHelper.shared.getUserIdentifier() == nil {
            performSegue(withIdentifier: "onboardingmodal", sender: self)
        }
        
        userNameButton.setTitle(UserModel.shared.userName, for: .normal)
        
        setMenuHeight()
        
    }
    
    fileprivate func setMenuHeight() {
        if UIScreen.main.bounds.height / UIScreen.main.bounds.width < 1.78 {
            commandHeightMenuConstraint.isActive = false // half the screen
            higherMenuHeightConstraint.isActive = true // 65% of the screen
        } else {
            commandHeightMenuConstraint.isActive = true
            higherMenuHeightConstraint.isActive = false
        }
    }
    
    fileprivate func buildCell(in: UICollectionView, for index: IndexPath, with item: MainMenuCollectionView.Item) -> UICollectionViewCell? {
        
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "commandCell", for: index) as? CommandCell {
            cell.setItem(item: item)
            return cell
        }
        
        return UICollectionViewCell()
    }
    
    fileprivate func getSnapshot() {
        var snapshot = NSDiffableDataSourceSnapshot<MainMenuCollectionView.Section, MainMenuCollectionView.Item>()
        
        snapshot.appendSections([.OnlySection])
        snapshot.appendItems(
            [.Speed,
             .StraightAhead,
             .Left,
             .Right,
             .Stop,
             .Warning
            ],
            toSection: .OnlySection
        )
        
        dataSource.apply(snapshot, animatingDifferences: true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showCommand",
           let destVC = segue.destination as? DisplayCommandViewController,
           let item = sender as? MainMenuCollectionView.Item {
            let (image, tint) = MainMenuCollectionView.getImageForItem(item: item)
            destVC.image = image
            destVC.tint = tint
            
            switch(item) {
                case .StraightAhead:
                    destVC.command = "Keep Straight!"
                case .Stop:
                    destVC.command = "Stop when possible!"
                case .Warning:
                    destVC.command = "Warning!"
                case .Left:
                    destVC.command = "Turn Left!"
                case .Right:
                    destVC.command = "Turn Right!"
                case .Speed:
                    destVC.command = "13 km/h"
            }
        }
    }
}

extension MainMenuViewController: UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        performSegue(withIdentifier: "showCommand", sender: dataSource.itemIdentifier(for: indexPath))
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let size = (collectionView.bounds.width - 60) / 2
        
        return CGSize(width: size, height: size)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 20.0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 20.0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        let space = 20.0
        
        return UIEdgeInsets(top: space * 1.5,
                            left: space,
                            bottom: space,
                            right: space)
    }
    
}
