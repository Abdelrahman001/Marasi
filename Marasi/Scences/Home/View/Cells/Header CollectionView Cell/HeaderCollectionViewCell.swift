//
//  HeaderCollectionViewCell.swift
//  Marasi
//
//  Created by Abdelrahman Hassan on 12/11/2021.
//

import UIKit
import Kingfisher

class HeaderCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var categoryIV: UIImageView!
    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var containerView: UIView!
    
    static let id = K.headerCollectionCellID
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupUI()
    }
    
    private func setupUI() {
        containerView.layer.borderWidth = 0.3
        containerView.layer.borderColor = UIColor.lightGray.cgColor
        containerView.layer.cornerRadius = 3
    }

    static func nib() -> UINib {
        return UINib(nibName: K.headerCollectionViewCell, bundle: nil)
    }
}

// MARK: - Header Collection View Cell Presenter Methods
extension HeaderCollectionViewCell: HeaderCollectionViewCellView {
    func displayCategoryImage(imageURL: URL) {
        categoryIV.kf.setImage(with: imageURL)
    }
    
    func displayCategoryTitle(name: String) {
        categoryLabel.text = name
    }
    
    func setCategoryTitleTextColor(color: String) {
        categoryLabel.textColor = UIColor(hexString: color)
    }
}
