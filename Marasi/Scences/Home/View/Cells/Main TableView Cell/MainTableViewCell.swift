//
//  MainTableViewCell.swift
//  Marasi
//
//  Created by Abdelrahman Hassan on 12/11/2021.
//

import UIKit

protocol MainCollectionViewCellView {
    func displayProductImage(imageURL: URL)
    func displayProductTitle(name: String)
    func displayPriceBeforeSale(price: NSMutableAttributedString)
    func displayPriceAfterSale(price: String)
    func displayProductSale(sale: String)
    func displayProductBrand(brand: String)
    func hideProductBadge()
    func hideSale()
    func displayProductBadge(badge: String, with textColor: String, backgroundColor: String)
}

class MainTableViewCell: UITableViewCell {
    
    @IBOutlet weak var productsCategoryLabel: UILabel!
    @IBOutlet weak var productsCategoryBackgroundIV: UIImageView!
    @IBOutlet weak var mainCollectionView: UICollectionView!
    
    static let id = K.mainTableViewCellID
    private var products = [Product]()
    private var numOfItemInCollectionViewCell = 0

    override func awakeFromNib() {
        super.awakeFromNib()
        
        configureMainCollectionView()
    }
    
    private func configureMainCollectionView() {
        mainCollectionView.register(MainCollectionViewCell.nib(), forCellWithReuseIdentifier: MainCollectionViewCell.id)
    }
    
    static func nib() -> UINib {
        return UINib(nibName: K.mainTableViewViewCell, bundle: nil)
    }
}
// MARK: - UICollection View Delegate Flow Layout Methods
extension MainTableViewCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 160, height: 300)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 12, left: 12, bottom: 12, right: 12)
    }
}
// MARK: - UICollection View Data Source Methods
extension MainTableViewCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return numOfItemInCollectionViewCell
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MainCollectionViewCell.id, for: indexPath) as! MainCollectionViewCell
        configure(cell: cell, for: indexPath.row)
        return cell
    }
    
    func configure(cell: MainCollectionViewCellView, for index: Int) {
        let product = products[index]
        if let productImageURL = URL(string: product.image) {
            cell.displayProductImage(imageURL: productImageURL)
        }
        cell.displayProductBrand(brand: product.brand)
        cell.displayProductTitle(name: product.title)
        if let productVariant = product.variants.first {
            cell.displayProductBadge(badge: productVariant.badge, with: productVariant.badgeTextColor, backgroundColor: productVariant.badgeBackground)
            if !productVariant.onSale {
                cell.hideSale()
            } else {
                let attributeString =  NSMutableAttributedString(string: "\(productVariant.currency) \(productVariant.price)")
                attributeString.addAttribute(.strikethroughStyle, value: 2, range: NSMakeRange(0, attributeString.length))
                cell.displayPriceBeforeSale(price: attributeString)
                cell.displayProductSale(sale: "خصم ٪\(productVariant.saleAmount)")
            }
            cell.displayPriceAfterSale(price: "\(productVariant.currency) \(productVariant.salePrice)")
        }
    }
}

// MARK: - Main Table View Cell View Protocol Methods
extension MainTableViewCell: MainTableViewCellView {
    func publishCollectionView(with products: [Product]) {
        self.products = products
    }
    
    func reloadData() {
        mainCollectionView.reloadData()
    }
    
    func showCategoryBackeground(imageURL: URL) {
        productsCategoryBackgroundIV.isHidden = false
        productsCategoryBackgroundIV.kf.setImage(with: imageURL)
    }
    
    func hideCategoryBackeground() {
        productsCategoryBackgroundIV.isHidden = true
    }
    
    func displayProductCategoryTitle(title: String) {
        productsCategoryLabel.text = title
        productsCategoryLabel.textColor = .black
        productsCategoryLabel.textAlignment = .right
    }
    
    func setCollectionViewCellsCount(numOfCells: Int) {
        numOfItemInCollectionViewCell = numOfCells
    }
    
    func displayProductCategoryTitleColor(textColor: String) {
        productsCategoryLabel.textAlignment = .center
        productsCategoryLabel.textColor = UIColor(hexString: textColor)
    }
}
