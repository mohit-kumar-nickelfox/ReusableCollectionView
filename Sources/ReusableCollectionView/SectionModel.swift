//
//  File.swift
//  
//
//  Created by Mohit Kumar Singh on 18/04/23.
//

import Foundation

public class SectionModel {
    
    public var headerModel: Any?
    public var cellModels: [Any] = []
    public var footerModel: Any?
    
    public init(headerModel: Any? = nil,
         cellModels: [Any] = [],
         footerModel: Any? = nil) {
        self.headerModel = headerModel
        self.cellModels = cellModels
        self.footerModel = footerModel
    }
}
