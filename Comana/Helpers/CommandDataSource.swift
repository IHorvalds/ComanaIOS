//
//  CommandDataSource.swift
//  Comana
//
//  Created by Tudor Croitoru on 23/10/2021.
//

import UIKit

class CommandDataSource: UICollectionViewDiffableDataSource<MainMenuCollectionView.Section, MainMenuCollectionView.Item> {

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return MainMenuCollectionView.Item.allCases.count
    }
}
