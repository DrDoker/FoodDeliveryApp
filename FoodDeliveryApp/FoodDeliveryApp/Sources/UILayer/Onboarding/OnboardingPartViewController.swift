//
//  OnboardingPartViewController.swift
//  FoodDeliveryApp
//
//  Created by Serhii  on 13/02/2024.
//

import UIKit
import SnapKit

class OnboardingPartViewController: UIViewController {
    
    // MARK: - Outlets
    private lazy var onboardingImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        return imageView
        
    }()
    
    private lazy var titleLable: UILabel = {
        let lable = UILabel()
        lable.textColor = AppColors.onboardingAccent
        lable.font = .Roboto.bold.size(of: 24)
        return lable
    }()
    
    private lazy var descriptionLable: UILabel = {
        let lable = UILabel()
        lable.numberOfLines = 0
        lable.textAlignment = .center
        lable.textColor = AppColors.onboardingAccent
        lable.font = .Roboto.regular.size(of: 14)
        return lable
    }()
    
    
    init(image: UIImage, title: String, description: String) {
        super.init(nibName: nil, bundle: nil)
        onboardingImageView.image = image
        titleLable.text = title
        descriptionLable.text = description
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupHierarchy()
        setupLayout()
    }
    
    // MARK: - Setup
    
    private func setupView() {
        view.backgroundColor = AppColors.onboardingBackgrond
    }
    
    private func setupHierarchy() {
        view.addSubview(onboardingImageView)
        view.addSubview(titleLable)
        view.addSubview(descriptionLable)
    }
    
    private func setupLayout() {
        
        onboardingImageView.snp.makeConstraints { make in
            make.centerX.equalTo(view)
            make.centerY.equalTo(view).offset(-50)
            make.height.equalTo(200)
            make.width.equalTo(200)
        }
        
        titleLable.snp.makeConstraints { make in
            make.top.equalTo(onboardingImageView.snp.bottom).offset(20)
            make.centerX.equalTo(view)
        }
        
        descriptionLable.snp.makeConstraints { make in
            make.top.equalTo(titleLable.snp.bottom).offset(23)
            make.left.equalTo(view).offset(65)
            make.right.equalTo(view).offset(-65)
        }
    }
    
    
}
