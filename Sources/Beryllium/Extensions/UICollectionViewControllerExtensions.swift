//
//  UICollectionViewControllerExtensions.swift
//  BerilioUI
//
//  Created by Cristian Diaz on 5.12.2022.
//

import Foundation
import UIKit

extension UICollectionViewController {
    
    public func indexPathAtCenter() -> IndexPath? {
        let center = view.convert(view.center, to: collectionView)
        return collectionView.indexPathForItem(at: center)
    }
}
