//
//  Home.swift
//  Marasi
//
//  Created by Abdelrahman Hassan on 12/11/2021.
//

import Foundation

// MARK: - Home
struct Home: Codable {
    let data: DataClass

    init(data: DataClass) {
        self.data = data
    }
}

// MARK: - DataClass
class DataClass: Codable {
    let banners: [Banner]

    init(banners: [Banner]) {
        self.banners = banners
    }
}

// MARK: - Banner
class Banner: Codable {
    let type: TypeEnum
    let content: Content

    init(type: TypeEnum, content: Content) {
        self.type = type
        self.content = content
    }
}

// MARK: - Content
class Content: Codable {
    let backgroundImage: String?
    let backgroundFocusPoint: String?
    let backgroundColor: String?
    let heading: String?
    let blocks: [Block]?
    let type: String?
    let id: Int?
    let products: [Product]?
    let textColor: String?
    let brands: [Brand]?

    init(backgroundImage: String?, backgroundFocusPoint: String?, backgroundColor: String?, heading: String?, blocks: [Block]?, type: String?, id: Int?, products: [Product]?, textColor: String?, brands: [Brand]?) {
        self.backgroundImage = backgroundImage
        self.backgroundFocusPoint = backgroundFocusPoint
        self.backgroundColor = backgroundColor
        self.heading = heading
        self.blocks = blocks
        self.type = type
        self.id = id
        self.products = products
        self.textColor = textColor
        self.brands = brands
    }
}

// MARK: - Block
class Block: Codable {
    let type: String?
    let id: Int
    let title: String?
    let blockImage: String?
    let blockBackgroundColor, textColor: String?
    let image: String?

    init(type: String?, id: Int, title: String?, blockImage: String?, blockBackgroundColor: String?, textColor: String?, image: String?) {
        self.type = type
        self.id = id
        self.title = title
        self.blockImage = blockImage
        self.blockBackgroundColor = blockBackgroundColor
        self.textColor = textColor
        self.image = image
    }
}

// MARK: - Brand
class Brand: Codable {
    let id: Int
    let image: String
    let category: Int

    init(id: Int, image: String, category: Int) {
        self.id = id
        self.image = image
        self.category = category
    }
}

// MARK: - Product
class Product: Codable {
    let id: Int
    let title: String
    let image: String
    let brand: String
    let rating: Double
    let variants: [Variant]

    init(id: Int, title: String, image: String, brand: String, rating: Double, variants: [Variant]) {
        self.id = id
        self.title = title
        self.image = image
        self.brand = brand
        self.rating = rating
        self.variants = variants
    }
}

// MARK: - Variant
class Variant: Codable {
    let id: Int
    let isDefault, hasStock: Bool
    let stock: Int
    let unlimitedStock: Bool
    let minQty, maxQty, weight: Int
    let dateAdded: String
    let onSale: Bool
    let currency: String
    let price, salePrice, saleAmount: Double
    let saleType: String?
    let bestSeller: Bool
    let badge: String
    let badgeTextColor: String
    let badgeBackground: String

    init(id: Int, isDefault: Bool, hasStock: Bool, stock: Int, unlimitedStock: Bool, minQty: Int, maxQty: Int, weight: Int, dateAdded: String, onSale: Bool, currency: String, price: Double, salePrice: Double, saleAmount: Double, saleType: String?, bestSeller: Bool, badge: String, badgeTextColor: String, badgeBackground: String) {
        self.id = id
        self.isDefault = isDefault
        self.hasStock = hasStock
        self.stock = stock
        self.unlimitedStock = unlimitedStock
        self.minQty = minQty
        self.maxQty = maxQty
        self.weight = weight
        self.dateAdded = dateAdded
        self.onSale = onSale
        self.currency = currency
        self.price = price
        self.salePrice = salePrice
        self.saleAmount = saleAmount
        self.saleType = saleType
        self.bestSeller = bestSeller
        self.badge = badge
        self.badgeTextColor = badgeTextColor
        self.badgeBackground = badgeBackground
    }
}

enum TypeEnum: String, Codable {
    case brandsSlider = "brandsSlider"
    case categoryCover = "categoryCover"
    case categoryProductsSlider = "categoryProductsSlider"
    case main = "main"
    case productsCover = "productsCover"
}

