//
//  AsyncUIImageView.swift
//  Cats_UIKit_In_SwiftUI
//
//  Created by Cameron on 8/24/23.
//

import Foundation
import UIKit

/// https://www.hackingwithswift.com/example-code/uikit/how-to-load-a-remote-image-url-into-uiimageview
class AsyncUIImageView: UIImageView {
    var loadingUrl: URL? = nil
    
    func load(url: URL?) {
        
        guard let url = url else {
            return
        }
        
        if loadingUrl != nil, loadingUrl == url {
            return
        }
        
        loadingUrl = url
        image = nil;
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image
                        self?.loadingUrl = nil
                    }
                }
            }
        }
    }
}
