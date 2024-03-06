//
//  OnboardingViewController.swift
//  FoodDeliveryApp
//
//  Created by Serhii  on 13/02/2024.
//

import UIKit
import SnapKit

// MARK: - OnboardingViewController
class OnboardingViewController: UIViewController {
    
    // MARK: - Propertis
    private var pages = [UIViewController]()
    private var currentPageIndex = 0
    var viewOutput: OnboardingViewOutput?
    
    // MARK: - Outlets
    private lazy var pageViewController: UIPageViewController = {
        let pageViewController = UIPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal)
        pageViewController.delegate = self
        pageViewController.dataSource = self
        pageViewController.view.backgroundColor = AppColors.accentOrange
        return pageViewController
    }()
    
    private lazy var pageControl: UIPageControl = {
        let pageControl = UIPageControl()
        pageControl.numberOfPages = pages.count
        pageControl.currentPage = 0
        pageControl.isUserInteractionEnabled = false
        return pageControl
    }()
    
    private lazy var bottomButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = AppColors.grey
        button.setTitle("Next", for: .normal)
        button.setTitleColor(AppColors.black, for: .normal)
        button.titleLabel?.font = .Roboto.bold.size(of: 18)
        button.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        button.layer.cornerRadius = 24
        
        return button
    }()
    
    // MARK: - Init
    init(pages: [UIViewController] = [], viewOutput: OnboardingViewOutput?) {
        self.pages = pages
        self.viewOutput = viewOutput
        super.init(nibName: nil, bundle: nil)
        
        addChild(pageViewController)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupPageViewController()
        setupHierarchy()
        setupLayout()
    }
    
    // MARK: - Setup
    func setupPageViewController() {
        guard let firstPage = pages.first else { return }
        pageViewController.setViewControllers([firstPage], direction: .forward, animated: true, completion: nil)
    }
    
    private func setupHierarchy() {
        view.addSubview(pageViewController.view)
        view.addSubview(pageControl)
        view.addSubview(bottomButton)
    }
    
    private func setupLayout() {
        pageControl.snp.makeConstraints { make in
            make.centerX.equalTo(view)
            make.bottom.equalTo(view).offset(-30)
        }
        
        bottomButton.snp.makeConstraints { make in
            make.bottom.equalTo(pageControl).offset(-50)
            make.left.equalTo(view).offset(30)
            make.right.equalTo(view).offset(-30)
            make.height.equalTo(50)
        }
    }
    
    // MARK: - Actions
    @objc func buttonPressed() {
        switch pageControl.currentPage {
        case 0:
            pageControl.currentPage = 1
            pageViewController.setViewControllers([pages[1]], direction: .forward, animated: true)
        case 1:
            pageControl.currentPage = 2
            pageViewController.setViewControllers([pages[2]], direction: .forward, animated: true)
        case 2:
            pageControl.currentPage = 3
            pageViewController.setViewControllers([pages[3]], direction: .forward, animated: true)
            bottomButton.setTitle("Cool!", for: .normal)
        case 3:
            print("Exit")
            viewOutput?.onboardingFinish()
        default:
            break
            
        }
    }
}

// MARK: - UIPageViewControllerDataSource delegate
extension OnboardingViewController: UIPageViewControllerDataSource {
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let index = pages.firstIndex(of: viewController), index > 0 else { return nil }
        return pages[index - 1]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let index = pages.firstIndex(of: viewController), index < pages.count - 1 else { return nil }
        return pages[index + 1]
    }
}

// MARK: - UIPageViewControllerDelegate delegate
extension OnboardingViewController: UIPageViewControllerDelegate {
    func pageViewController(_ pageViewController: UIPageViewController, willTransitionTo pendingViewControllers: [UIViewController]) {
        if let viewController = pendingViewControllers.first,
           let index = pages.firstIndex(of: viewController) {
            currentPageIndex = index
        }
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        if completed {
            pageControl.currentPage = currentPageIndex
            if currentPageIndex == pages.count - 1 {
                bottomButton.setTitle("Cool!", for: .normal)
            } else {
                bottomButton.setTitle("Next", for: .normal)
            }
        }
    }
}
