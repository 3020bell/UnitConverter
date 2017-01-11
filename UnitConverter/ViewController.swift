//
//  ViewController.swift
//  UnitConverter
//
//  Created by Nick on 11/01/2017.
//  Copyright © 2017 Nick Bell. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var scrollView: UIScrollView!
    
    var buttons = [UIImageView]()
    
    var currentPage = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidLoad()
        
        var contentWidth: CGFloat = 0.0
        
        let screenSize = UIScreen.main.bounds
        let screenWidth = screenSize.width
        let screenHeight = screenSize.height
        
        scrollView.frame.size.width = 3 * (screenWidth / 5)
        scrollView.frame.size.height = screenHeight
        scrollView.center = CGPoint(x: screenWidth / 2, y: screenHeight / 2)
        let scrollWidth = scrollView.frame.size.width
        
        
        for x in 0...5 {
            let image = UIImage(named: "icon\(x)")
            let buttonView = UIImageView(image: image)
            buttons.append(buttonView)
            
            var newX: CGFloat = 0.0
            newX = (scrollWidth / 2) + scrollWidth * CGFloat(x)
            contentWidth += scrollWidth
            
            scrollView.addSubview(buttonView)
            
            buttonView.frame = CGRect(x: newX - (screenWidth / 6), y: scrollView.frame.size.height / 2 - (screenWidth / 6), width: screenWidth / 3, height: screenWidth / 3)
        }
        
        scrollView.clipsToBounds = false
        
        scrollView.contentSize = CGSize(width: contentWidth, height: scrollView.frame.size.height)
        
    }

    @IBAction func leftSwipe(_ sender: Any) {
        if currentPage == 5 {
            
        } else {
            let scrollWidth = scrollView.frame.size.width
            let scrollPos: CGPoint = CGPoint(x: CGFloat(currentPage) * scrollWidth + scrollWidth, y: 0.0)
            scrollView.setContentOffset(scrollPos, animated: true)
            currentPage += 1
        }
    }
    
    @IBAction func rightSwipe(_ sender: Any) {
        if currentPage == 0 {
            
        } else {
            let scrollWidth = scrollView.frame.size.width
            let scrollPos: CGPoint = CGPoint(x: CGFloat(currentPage) * scrollWidth - scrollWidth, y: 0.0)
            scrollView.setContentOffset(scrollPos, animated: true)
            currentPage -= 1
        }
    }
    
}

