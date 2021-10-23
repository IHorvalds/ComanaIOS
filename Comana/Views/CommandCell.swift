//
//  CommandCell.swift
//  Comana
//
//  Created by Tudor Croitoru on 23/10/2021.
//

import UIKit

class CommandCell: UICollectionViewCell {
    
    private var item: MainMenuCollectionView.Item! = nil
    
    @IBOutlet weak var indicatorImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        layer.cornerRadius = 10.0
    }
    
    public func setItem(item: MainMenuCollectionView.Item) {
        self.item = item
        let (image, tint) = MainMenuCollectionView.getImageForItem(item: item)
        indicatorImageView.image = image
        indicatorImageView.tintColor = tint
    }
    
}
