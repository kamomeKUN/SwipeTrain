//
//  ViewController.swift
//  Swift5SwipeApp
//
//  Created by kamomeKUN on 2020/04/14.
// Copyright ©︎ 2020 kamomeKUN. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var selectSegment: UISegmentedControl!
    
    let idList: [String] = ["first", "second"]
    
    var pageViewController: UIPageViewController!
    var viewControllers: [UIViewController] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        for id in idList {
            viewControllers.append((storyboard?.instantiateViewController(withIdentifier: id))!)
        }
        pageViewController = children.first as? UIPageViewController
        pageViewController.setViewControllers([viewControllers[0]], direction: .forward, animated: true, completion: nil)
        pageViewController.delegate = self
        pageViewController.dataSource = self
    }
}

extension ViewController: UIPageViewControllerDelegate, UIPageViewControllerDataSource {
     
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        let index = viewController.view.tag - 1
        if index == 0 { return nil }
        return storyboard?.instantiateViewController(withIdentifier: idList[index-1])
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        let index = viewController.view.tag - 1
        if index == 1 { return nil }
        return storyboard?.instantiateViewController(withIdentifier: idList[index+1])
    }
    
    
}

