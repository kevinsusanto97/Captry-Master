//
//  WalkthroughPageViewController.swift
//  Captry
//
//  Created by Enjelina on 17/07/19.
//  Copyright © 2019 Kevin Susanto. All rights reserved.
//

import UIKit

// 1. Add UIPageViewControllerDataSource + fix
class WalkthroughPageViewController: UIPageViewController, UIPageViewControllerDataSource {
    
    
    // 2. Add MARK: - Properties
    var pageHeadings = ["One Place learning", "Improve Creativity", "Simple and Easy Guidelines"]
    var pageImages = ["RuleOfThirds1", "RuleOfThirds2", "RuleOfThirds3"]
    var pageSubHeadings = ["Learn Composition Photography from theory to practice at the same app", "Get inspired from collection photos and experiment with it", "You can switch the composition on or off"]
    var currentIndex = 0
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // 7. Set data source to itself
        dataSource = self
        
        // 8. Create the first walkthrough screen
        if let startingViewController = contentViewController(at: 0) {
            setViewControllers([startingViewController], direction: .forward, animated: true, completion: nil)
        }

        
        
    }
    // 3. Add MARK: - Page View Controller Data Source
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        var index = (viewController as! WalkthroughContentViewController).index
        index -= 1
        return contentViewController(at: index)
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        var index = (viewController as! WalkthroughContentViewController).index
        index += 1
        return contentViewController(at: index)
    }
    
    // 4. Add MARK: - Helper
    func contentViewController(at index: Int) -> WalkthroughContentViewController? {
        if index < 0  || index >= pageHeadings.count {
            return nil
        }
        // 5. Create a new VC and pass suitable data
        let storyboard = UIStoryboard(name: "Onboarding", bundle: nil)
        if let pageContentViewController = storyboard.instantiateViewController(withIdentifier: "WalkthroughContentViewController") as? WalkthroughContentViewController{
            pageContentViewController.imageFile = pageImages[index]
            pageContentViewController.heading = pageHeadings[index]
            pageContentViewController.subHeading = pageSubHeadings[index]
            pageContentViewController.index = index
            
            return pageContentViewController
        }
        return nil
    }

}
