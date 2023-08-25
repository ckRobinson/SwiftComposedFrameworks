//
//  CatCellViewController.swift
//  Cats_UIKit_In_SwiftUI
//
//  Created by Cameron on 8/24/23.
//

import Foundation
import UIKit

class CatTableViewCellController: UITableViewCell {
    
    @IBOutlet weak var activitySpinner: UIActivityIndicatorView!
    @IBOutlet weak var catImage: AsyncUIImageView!
    @IBOutlet weak var type: UILabel!
    @IBOutlet weak var name: UILabel!
}

