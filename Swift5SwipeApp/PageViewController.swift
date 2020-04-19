//
//  PageViewController.swift
//  Swift5SwipeApp
//
//  Created by kamomeKUN on 2020/04/19.
// Copyright ©︎ 2020 kamomeKUN. All rights reserved.
//

import UIKit

class PageViewController: UIPageViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.setViewControllers([getFirst()], direction: .forward, animated: true, completion: nil)
        self.dataSource = self
        self.delegate = self
    }
    
    
    func getFirst() -> FirstViewController {
        return storyboard!.instantiateViewController(withIdentifier: "FirstViewController") as! FirstViewController
    }
    
    func getSecond() -> SecondViewController {
        return storyboard!.instantiateViewController(withIdentifier: "SecondViewController") as! SecondViewController
    }

}

extension PageViewController : UIPageViewControllerDelegate, UIPageViewControllerDataSource {
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        
        // 2 -> 1
        if viewController.isKind(of: SecondViewController.self) {
            return getFirst()
        }
        // 1 -> 1
        else if viewController.isKind(of: FirstViewController.self) {
            return nil
        } else {
            return nil
        }
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        
        // 1 -> 2
        if viewController.isKind(of: FirstViewController.self) {

            return getSecond()
        }
        // 2 -> 2
        else if viewController.isKind(of: SecondViewController.self) {
            return nil
        } else {
            return nil
        }
    }
    
    
}
