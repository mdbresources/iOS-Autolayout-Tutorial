//
//  PagerViewController.swift
//  AutoLayoutTutorial
//
//  Created by Anmol Parande on 2/21/19.
//  Copyright © 2019 Anmol Parande. All rights reserved.
//

import UIKit

class PagerViewController: UIPageViewController, UIPageViewControllerDataSource {
    
    private var vcs: [UIViewController]!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        dataSource = self
        
        vcs = [self.viewController(withId: "buggy"), self.viewController(withId: "storyboard"), self.viewController(withId: "programmatic")]
        
        if let buggyVC = vcs.first {
            self.setViewControllers([buggyVC], direction: .forward, animated: true, completion: nil)
        }
    }
    
    private func viewController(withId id: String) -> UIViewController {
        return UIStoryboard(name: "Main", bundle: nil) .
            instantiateViewController(withIdentifier: id)
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let index = vcs.lastIndex(where: {$0 == viewController}) else {
            return nil
        }
        let prev = index - 1
        if prev < 0 {
            return nil
        } else {
            return self.vcs[prev]
        }
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let index = vcs.lastIndex(where: {$0 == viewController}) else {
            return nil
        }
        let curr = index + 1
        if curr >= vcs.count {
            return nil
        } else {
            return self.vcs[curr]
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
