//
//  MainMenuCollectionCell.swift
//  Comana
//
//  Created by Tudor Croitoru on 23/10/2021.
//

import Foundation
import UIKit

struct MainMenuCollectionView {
    
    enum Section: Hashable {
        case OnlySection
    }
    
    enum Item: Hashable, CaseIterable {
        case StraightAhead
        case Stop
        case Warning
        case Left
        case Right
        case Speed
    }
    
    static public func getImageForItem(item: Item) -> (UIImage, UIColor) {
        switch(item)
        {
            case .StraightAhead:
                return (
                    UIImage(systemName: "arrow.up.circle.fill", withConfiguration: UIImage.SymbolConfiguration(scale: .large))!,
                    .systemGreen
                )
            case .Stop:
                return (
                    UIImage(systemName: "exclamationmark.octagon.fill", withConfiguration: UIImage.SymbolConfiguration(scale: .large))!,
                    .systemRed
                    )
            case .Warning:
                return (
                    UIImage(systemName: "exclamationmark.triangle.fill", withConfiguration: UIImage.SymbolConfiguration(scale: .large))!,
                    .systemYellow
                    )
            case .Left:
                return (
                    UIImage(systemName: "arrow.left.circle.fill", withConfiguration: UIImage.SymbolConfiguration(scale: .large))!,
                    .systemGreen
                    )
            case .Right:
                return (
                    UIImage(systemName: "arrow.right.circle.fill", withConfiguration: UIImage.SymbolConfiguration(scale: .large))!,
                    .systemGreen
                    )
            case .Speed:
                return (
                    UIImage(systemName: "speedometer", withConfiguration: UIImage.SymbolConfiguration(scale: .large))!,
                    .systemBlue
                    )
        }
    }
}
