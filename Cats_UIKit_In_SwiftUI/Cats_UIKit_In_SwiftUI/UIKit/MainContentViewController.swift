//
//  MainContentViewController.swift
//  Cats_UIKit_In_SwiftUI
//
//  Created by Cameron on 8/24/23.
//

import Foundation
import UIKit

class MainContentViewController: UIViewController {
    
    var viewModel: ContentViewModel = ContentViewModel()
    
    @IBOutlet weak var itemList: UITableView!
    var dataSource: [CatsData] = [] {
        didSet {
            itemList.reloadData()
        }
    }
    
    @IBAction func loadData(_ sender: Any) {
        viewModel.loadData() { [weak self] data in
            self?.dataSource = data
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension MainContentViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CatCell") as? CatTableViewCellController else {
            return UITableViewCell()
        }
        let data = dataSource[indexPath.row]
        cell.name.text = data.name
        cell.type.text = data.breed
        cell.activitySpinner.startAnimating()
        cell.catImage.load(url: URL(string: data.photo) ?? nil)
        
        return cell
    }
}
