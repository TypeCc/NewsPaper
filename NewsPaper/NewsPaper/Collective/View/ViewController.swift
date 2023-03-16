//
//  ViewController.swift
//  NewsPaper
//
//  Created by serif mete on 16.03.2023.
//

import UIKit
import SnapKit

protocol NewsPaperViewOutPut {
    func changeLoading(isLoad: Bool)
    func saveData(values: [Article])
}

final class ViewController: UIViewController {
    
    //MARK: - My Variable
    
    private let labelTitle: UILabel = UILabel()
    private let tableView: UITableView = UITableView()
    private let indicator: UIActivityIndicatorView = UIActivityIndicatorView()
    private lazy var articles: [Article] = []
    lazy var viewModel : INewsPaperViewModel = NewsPaperViewModel()
    
    //MARK: - My Func
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        configure()
        viewModel.setDelegate(output: self)
        viewModel.fetchItems()
        
    }

    private func configure(){
        view.addSubview(labelTitle)
        view.addSubview(indicator)
        view.addSubview(tableView)
        drawDesing()
        makeLbl()
        makeİndicator()
        makeTableView()
    }
    
    private func drawDesing(){
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(NewsPaperTableViewCell.self, forCellReuseIdentifier: NewsPaperTableViewCell.Identifer.Id.rawValue)
        tableView.rowHeight = 100
        DispatchQueue.main.async {
            self.view.backgroundColor = .white
            self.labelTitle.font = .boldSystemFont(ofSize: 35)
            self.indicator.color = .red
            self.labelTitle.text = "Turkey News"
        }
        indicator.startAnimating()
    }
     
}

extension ViewController: NewsPaperViewOutPut {
    
    func changeLoading(isLoad: Bool) {
        isLoad ? indicator.startAnimating() : indicator.stopAnimating()
    }
    
    func saveData(values: [Article]) {
        articles = values
        tableView.reloadOnMainThread()
    }
}

//MARK: - TableView Settings
    
extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    internal func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell: NewsPaperTableViewCell = tableView.dequeueReusableCell(withIdentifier: NewsPaperTableViewCell.Identifer.Id.rawValue) as? NewsPaperTableViewCell else {
            return UITableViewCell()
        }
        cell.Label(model: articles[indexPath.row])
        return cell
    }
    
    internal func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return articles.count
    }
    
    internal func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let tapPost = articles[indexPath.row]
        // Open the URL on browser
        UIApplication.shared.open(URL(string: tapPost.url!)!, options: [:], completionHandler: nil)
    }
    
    
}

//MARK: - SnapKit Make Variable

extension ViewController {
    private func makeLbl() {
        labelTitle.snp.makeConstraints { (make) in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(10)
            make.left.equalTo(view).offset(10)
            make.right.equalTo(view).offset(-10)
            make.height.greaterThanOrEqualTo(10)
        }
    }
    
    private func makeTableView() {
        tableView.snp.makeConstraints { (make) in
            make.top.equalTo(labelTitle.snp.bottom).offset(5)
            make.bottom.equalToSuperview()
            make.left.right.equalTo(labelTitle)
        }
    }
    
    private func makeİndicator() {
        indicator.snp.makeConstraints { (make) in
            make.height.equalTo(labelTitle)
            make.right.equalTo(labelTitle).offset(-5)
            make.top.equalTo(labelTitle)
        }
    }
    
}
