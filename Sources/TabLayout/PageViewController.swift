import Foundation
import UIKit

class PageViewController: UIPageViewController {
    
    let contents: [UIViewController]
    
    init(
        transitionStyle style: UIPageViewController.TransitionStyle,
        navigationOrientation: UIPageViewController.NavigationOrientation,
        options: [UIPageViewController.OptionsKey : Any]? = nil,
        contents: [UIViewController]
    ) {
        self.contents = contents
        super.init(transitionStyle: style, navigationOrientation: navigationOrientation, options: options)
        
        delegate = self
        dataSource = self
        
        setViewControllers([contents[0]], direction: .forward, animated: true, completion: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
}

extension PageViewController: UIPageViewControllerDelegate, UIPageViewControllerDataSource {
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let index = contents.firstIndex(of: viewController) else {
            return nil
        }
        
        if index == contents.count - 1 {
            return viewController
        }
        let next = index + 1
        return contents[next]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let index = contents.firstIndex(of: viewController) else {
            return nil
        }
        
        if index == 0 {
            return viewController
        }
        let previous = index - 1
        return contents[previous]
    }
    
    
}
