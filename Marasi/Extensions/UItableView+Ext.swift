//
//  UItableView+Ext.swift
//  Marasi
//
//  Created by Abdelrahman Hassan on 12/11/2021.
//

import UIKit

let spinner = UIActivityIndicatorView(style: .large)

enum InidcatorState {
    case start
    case stop
}

extension UITableView {
    func activityIndicator(state: InidcatorState) {
        self.backgroundView = spinner
        switch state {
        case .start:
            spinner.startAnimating()
        case .stop:
            spinner.stopAnimating()
        }
    }
}
