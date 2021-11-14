//
//  FooterCollectionViewCell.swift
//  Marasi
//
//  Created by Abdelrahman Hassan on 14/11/2021.
//

import UIKit
import Kingfisher

class FooterCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var brandIV: UIImageView!
    
    static let id = K.footerCollectionViewCellID
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    static func nib() -> UINib {
        return UINib(nibName: K.footerCollectionViewCell, bundle: nil)
    }
}

// MARK: - Footer Collection View Cell View protocol Methods
extension FooterCollectionViewCell: FooterCollectionViewCellView {
    func displayCategoryImage(imageURL: URL) {
        brandIV.kf.setImage(with: imageURL)
    }
}
