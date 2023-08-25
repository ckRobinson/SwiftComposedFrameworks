//
//  ViewController.swift
//  Cats_SwiftUI_In_UIKit
//
//  Created by Cameron on 8/24/23.
//

import UIKit
import SwiftUI

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        loadPostScene()
    }

    func loadPostScene() {
        let hostingVC = UIHostingController(rootView: ContentView())
        addChild(hostingVC)
        view.addSubview(hostingVC.view)
        hostingVC.view.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            hostingVC.view.topAnchor.constraint(equalTo: view.topAnchor),
            hostingVC.view.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            hostingVC.view.leftAnchor.constraint(equalTo: view.leftAnchor),
            hostingVC.view.rightAnchor.constraint(equalTo: view.rightAnchor)
        ])
        hostingVC.didMove(toParent: self)
    }
}

