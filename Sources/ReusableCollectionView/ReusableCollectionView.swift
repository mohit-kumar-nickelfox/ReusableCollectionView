//
//  File.swift
//  
//
//  Created by Mohit Kumar Singh on 18/04/23.
//

import UIKit

public protocol ReusableCollectionViewProtocol: AnyObject {
    var collectionViewData: [SectionModel] { get set }
    
    func numberOfSections() -> Int
    func numberOfItemsAt(section: Int) -> Int
    func item(at indexPath: IndexPath) -> Any
    func headerItem(at section: Int) -> Any?
    func setupData()
}

public extension ReusableCollectionViewProtocol {
    func numberOfSections() -> Int {
        return collectionViewData.count
    }
    
    func numberOfItemsAt(section: Int) -> Int {
        return collectionViewData[section].cellModels.count
    }
    
    func item(at indexPath: IndexPath) -> Any {
        return collectionViewData[indexPath.section].cellModels[indexPath.row]
    }
    
    func headerItem(at section: Int) -> Any? {
        return self.collectionViewData[section].headerModel
    }
}

open class CollectionViewController: UIViewController {
    public var viewModel: ReusableCollectionViewProtocol!
    @IBOutlet weak var collectionView: UICollectionView!
    
    open override func viewDidLoad() {
        super.viewDidLoad()
        self.setupCollectionView()
        self.setupViewModel()
    }
    
    open func setupViewModel() {
//        self.setupCollectionView()
    }
    
    /// Override this method to register cells header and footer
    open func setupCollectionView() {
        self.collectionView.collectionViewLayout = self.createCompositionalLayout()
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
    }
    
    /// Override this function to add classes
    /// - Parameter indexPath: IndexPath for the cell
    /// - Returns: Reusable Identifier for the cell
   open func identifier(at indexPath: IndexPath) -> String? {
        let item = self.viewModel.item(at: indexPath)
        switch item {
        default: return nil
        }
    }
}

// MARK: UICollectionViewDelegate
extension CollectionViewController: UICollectionViewDelegate {
    
    
}

// MARK: UICollectionViewDataSource
extension CollectionViewController: UICollectionViewDataSource {
    
    open func numberOfSections(in collectionView: UICollectionView) -> Int {
        return self.viewModel.numberOfSections()
    }
    
    open func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.viewModel.numberOfItemsAt(section: section)
    }
    
    open func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let identifier = self.identifier(at: indexPath),
              let cell = collectionView.dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath) as? CollectionViewCell else {
                  return UICollectionViewCell()
              }
        cell.item = self.viewModel.item(at: indexPath)
        cell.delegate = self
        return cell
    }
    
    
}

