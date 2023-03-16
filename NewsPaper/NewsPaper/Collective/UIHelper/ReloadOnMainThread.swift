//
//  ReloadOnMainThread.swift
//  NewsPaper
//
//  Created by serif mete on 16.03.2023.
//

import UIKit

extension UITableView {
    func reloadOnMainThread() {
        DispatchQueue.main.async {
            self.reloadData()
        }
    }
}
