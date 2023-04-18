//
//  File.swift
//  
//
//  Created by Mohit Kumar Singh on 18/04/23.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {

    var item: Any? {
        didSet {
            self.configure(self.item)
        }
    }
    
    weak var delegate: NSObjectProtocol?
    
    func configure(_ item: Any?) {
        
    }
    
}

class CollectionReusableView: UICollectionReusableView {
    
    var item: Any? {
        didSet {
            self.configure(self.item)
        }
    }
    
    weak var delegate: NSObjectProtocol?
    
    func configure(_ item: Any?) {
        
    }
    
}
