//
//  ViewController.swift
//  FoodDeliveryApp
//
//  Created by Serhii  on 07/02/2024.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    
    // MARK: - Outlets
    private lazy var titleLable: UILabel = {
        let lable = UILabel()
        lable.text = "Hello World!"
        lable.textColor = .white
        lable.font = .Roboto.light.size(of: 40)
        return lable
    }()
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        setupHierarchy()
        setupLayout()
    }
    
    // MARK: - Setup
    
    private func setupHierarchy() {
        view.addSubview(titleLable)
    }
    
    private func setupLayout() {
        
        titleLable.snp.makeConstraints { make in
            make.top.equalTo(view).offset(200)
            make.left.equalTo(view).offset(20)
            make.right.equalTo(view).offset(-20)
        }
    }
    
    
}

