//
//  HomeVC.swift
//  Marasi
//
//  Created by Abdelrahman Hassan on 11/11/2021.
//

import UIKit
import Kingfisher

class HomeVC: UIViewController {

    @IBOutlet weak var marasiBarBtnItem: UIBarButtonItem!
    @IBOutlet weak var searchBarBtnItem: UIBarButtonItem!
    @IBOutlet weak var headerCollectionView: UICollectionView!
    @IBOutlet weak var headerBackgroundIV: UIImageView!
    @IBOutlet weak var mainTableView: UITableView!
    @IBOutlet weak var homeSearchBar: UISearchBar!
    @IBOutlet weak var footerCollectionView: UICollectionView!
    @IBOutlet weak var footerCategoryLabel: UILabel!
    
    lazy var presenter = HomeVCPresenter(view: self)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        configureCollectionView()
        configureMainTableView()
        presenter.viewDidLoad()
    }

    private func setupUI() {
        homeSearchBar.searchTextField.textAlignment = .right
        homeSearchBar.searchTextField.font = UIFont(name: "Cairo", size: 14)
        marasiBarBtnItem.setTitleTextAttributes([.font: UIFont(name: "Cairo-Bold", size: 22)!], for: .normal)
    }
    
    private func configureCollectionView() {
        headerCollectionView.register(HeaderCollectionViewCell.nib(), forCellWithReuseIdentifier: HeaderCollectionViewCell.id)
        footerCollectionView.register(FooterCollectionViewCell.nib(), forCellWithReuseIdentifier: FooterCollectionViewCell.id)
    }
    
    private func configureMainTableView() {
        mainTableView.register(MainTableViewCell.nib(), forCellReuseIdentifier: MainTableViewCell.id)
    }
}

// MARK: - UICollection View Data Source Methods
extension HomeVC: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return collectionView == headerCollectionView ? presenter.getBlocksCount() : presenter.getBrandsCount()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == headerCollectionView {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HeaderCollectionViewCell.id, for: indexPath) as! HeaderCollectionViewCell
            presenter.configure(cell: cell, for: indexPath.row)
            return cell
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FooterCollectionViewCell.id, for: indexPath) as! FooterCollectionViewCell
            presenter.configure(cell: cell, for: indexPath.row)
            return cell
        }
    }
}

// MARK: - UICollection View Delegate FlowLayout Methods
extension HomeVC: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 12, left: 12, bottom: 12, right: 12)
    }
}

// MARK: - UITableView Data Source Methods
extension HomeVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.getBannersCount()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: K.mainTableViewCellID, for: indexPath) as! MainTableViewCell
        presenter.configure(cell: cell, for: indexPath.row)
        return cell
    }
}

// MARK: - UITableView Data Source Methods
extension HomeVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 400
    }
}


// MARK: - Home Presenter Methods
extension HomeVC: HomeView {
    func fetchFooterDataSuccess() {
        footerCollectionView.reloadData()
    }
    
    func displayFooterTitle(title: String) {
        footerCategoryLabel.text = title
    }
    
    func fetchTableViewDataSuccess() {
        mainTableView.reloadData()
    }
    
    func fetchHeaderDataSuccess() {
        headerCollectionView.reloadData()
    }
    
    func showIndicator() {
        mainTableView.activityIndicator(state: .start)
    }
    
    func hideIndicator() {
        mainTableView.activityIndicator(state: .stop)
    }
    
    func displayHeaderImage(imageURL: URL) {
        headerBackgroundIV.kf.setImage(with: imageURL)
    }
    
    func displayError(error: String) {
        let alert = UIAlertController(title: "", message: MarasiError.unabelToComplete.rawValue, preferredStyle: .alert)
        self.present(alert, animated: true) {
            DispatchQueue.main.asyncAfter(deadline: .now()+4) {
                alert.dismiss(animated: true)
            }
        }
    }
}
