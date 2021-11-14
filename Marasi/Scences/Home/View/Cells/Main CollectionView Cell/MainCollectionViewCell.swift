//
//  MainCollectionViewCell.swift
//  Marasi
//
//  Created by Abdelrahman Hassan on 13/11/2021.
//

import UIKit
import Kingfisher

class MainCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var productIV: UIImageView!
    @IBOutlet weak var badgeLabel: UILabel!
    @IBOutlet weak var brandLabel: UILabel!
    @IBOutlet weak var priceBeforeSaleLabel: UILabel!
    @IBOutlet weak var saleLabel: UILabel!
    @IBOutlet weak var priceAfterSaleLabel: UILabel!
    @IBOutlet weak var productTitleLabel: UILabel!
    @IBOutlet weak var saleStackView: UIStackView!
    @IBOutlet weak var addToBasketBtn: UIButton!
    @IBOutlet weak var containerView: UIView!
    
    static let id = K.mainCollectionViewCellID
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupUI()
    }
    
    private func setupUI() {
        addToBasketBtn.layer.borderColor = DesignSystem.Colors.actionTextPrimary.color.cgColor
        containerView.layer.borderWidth = 0.3
        containerView.layer.borderColor = UIColor.lightGray.cgColor
        containerView.layer.cornerRadius = 3
    }
    
    static func nib() -> UINib {
        return UINib(nibName: K.mainCollectionViewCell, bundle: nil)
    }
}

// MARK: - Main Collection View Cell View Protocol Methods
extension MainCollectionViewCell: MainCollectionViewCellView {
    func displayProductImage(imageURL: URL) {
        productIV.kf.setImage(with: imageURL)
    }
    
    func displayProductTitle(name: String) {
        productTitleLabel.text = name
    }
    
    func displayPriceBeforeSale(price: NSMutableAttributedString) {
        priceBeforeSaleLabel.attributedText = price
    }
    
    func displayPriceAfterSale(price: String) {
        priceAfterSaleLabel.text = price
    }
    
    func displayProductSale(sale: String) {
        saleLabel.text = sale
    }
    
    func displayProductBrand(brand: String) {
        brandLabel.text = brand
    }
    
    func hideProductBadge() {
        badgeLabel.isHidden = true
    }
    
    func hideSale() {
        saleStackView.isHidden = true
    }
    
    func displayProductBadge(badge: String, with textColor: String, backgroundColor: String) {
        badgeLabel.text = badge
        badgeLabel.textColor = UIColor(hexString: textColor)
        badgeLabel.backgroundColor = UIColor(hexString: backgroundColor)
    }
}
