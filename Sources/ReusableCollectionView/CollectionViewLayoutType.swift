//
//  File.swift
//  
//
//  Created by Mohit Kumar Singh on 18/04/23.
//

import Foundation

public enum CollectionViewLayoutType {
    case list,
         fixedHorizontalCount(count: Int),
         fixedVerticalCount(count: Int),
         horizontalScrollable(spacing: CGFloat),
         horizontalScrollableScreenWidthPaging
}

public protocol ReusableColectionHeaderViewModelProtocol: AnyObject {
    var layoutType: CollectionViewLayoutType { get set }
}
