//
//  HomeVCPresenter.swift
//  Marasi
//
//  Created by Abdelrahman Hassan on 12/11/2021.
//

import Foundation

protocol HomeView: AnyObject {
    func fetchHeaderDataSuccess()
    func fetchTableViewDataSuccess()
    func fetchFooterDataSuccess()
    func showIndicator()
    func hideIndicator()
    func displayHeaderImage(imageURL: URL)
    func displayFooterTitle(title: String)
    func displayError(error: String)
}

protocol HeaderCollectionViewCellView {
    func displayCategoryImage(imageURL: URL)
    func displayCategoryTitle(name: String)
    func setCategoryTitleTextColor(color: String)
}

protocol FooterCollectionViewCellView {
    func displayCategoryImage(imageURL: URL)
}

protocol MainTableViewCellView {
    func reloadData()
    func showCategoryBackeground(imageURL: URL)
    func hideCategoryBackeground()
    func displayProductCategoryTitle(title: String)
    func displayProductCategoryTitleColor(textColor: String)
    func setCollectionViewCellsCount(numOfCells: Int)
    func publishCollectionView(with products: [Product])
}

class HomeVCPresenter {
    private weak var view: HomeView!
    private let interactor = HomeInteractor()
    private var brands = [Brand]() {
        didSet {
            view.fetchFooterDataSuccess()
        }
    }
    private var blocks = [Block]() {
        didSet{
            view.fetchHeaderDataSuccess()
        }
    }
    private var bannersWithoutMain = [Banner]() {
        didSet {
            view.fetchTableViewDataSuccess()
        }
    }
    
    init(view: HomeView) {
        self.view = view
    }
    
    func viewDidLoad() {
        homeRequest()
    }
    
    private func homeRequest() {
        view.showIndicator()
        interactor.homeRequest { [weak self] result in
            guard let self = self else { return }
            self.view.hideIndicator()
            switch result {
            case .success(let homeResponse):
                let banners = homeResponse.data.banners
                self.configureMainBanner(banners: banners)
                self.configureBrandsBanner(banners: banners)
                self.bannersWithoutMain = banners.filter({ return $0.type != .main && $0.type != .brandsSlider })
            case .failure(let error):
                self.view.displayError(error: error.rawValue)
            }
        }
    }
    
    private func configureMainBanner(banners: [Banner]) {
        guard let mainBanner = banners.first, let backgroundImage = mainBanner.content.backgroundImage, let backgroundImageURL = URL(string: backgroundImage) else { return }
        self.view.displayHeaderImage(imageURL: backgroundImageURL)
        if let blocks = mainBanner.content.blocks {
            self.blocks = blocks
        }
    }
    
    private func configureBrandsBanner(banners: [Banner]) {
        guard let brandsBanner = banners.last else { return }
        if let footerTitle = brandsBanner.content.heading {
            view.displayFooterTitle(title: footerTitle)
        }
        if let brands = brandsBanner.content.brands {
            self.brands = brands
        }
    }
    
    func configure(cell: HeaderCollectionViewCellView, for index: Int) {
        let block = blocks[index]
        cell.displayCategoryTitle(name: block.title ?? "")
        guard let categoryImageURLStr = block.blockImage, let categoryImageURL = URL(string: categoryImageURLStr) else { return }
        cell.displayCategoryImage(imageURL: categoryImageURL)
    }
    
    func configure(cell: FooterCollectionViewCellView, for index: Int) {
        let brand = brands[index]
        guard let categoryImageURL = URL(string: brand.image) else { return }
        cell.displayCategoryImage(imageURL: categoryImageURL)
    }
    
    func configure(cell: MainTableViewCellView, for index: Int) {
        let banner = bannersWithoutMain[index]
        if let productCategoryTitle = banner.content.heading {
            cell.displayProductCategoryTitle(title: productCategoryTitle)
        }
        if banner.type == .categoryCover || banner.type == .productsCover {
            guard let productCategoryImageStr = banner.content.backgroundImage, let productCategoryImageURL = URL(string: productCategoryImageStr) else { return }
            cell.showCategoryBackeground(imageURL: productCategoryImageURL)
        } else {
            cell.hideCategoryBackeground()
        }
        if let productCategoryTitleTextColor = banner.content.textColor {
            cell.displayProductCategoryTitleColor(textColor: productCategoryTitleTextColor)
        }
        if let products = banner.content.products {
            cell.reloadData()
            cell.publishCollectionView(with: products)
            cell.setCollectionViewCellsCount(numOfCells: products.count)
        }
    }
    
    func getBannersCount() -> Int {
        return bannersWithoutMain.count
    }
    
    func getBlocksCount() -> Int {
        return blocks.count
    }
    
    func getBrandsCount() -> Int {
        return brands.count
    }
}
