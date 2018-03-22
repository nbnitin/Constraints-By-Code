//
//  ViewController.swift
//  Constraints At Run Time
//
//  Created by Nitin Bhatia on 21/03/18.
//  Copyright © 2018 Nitin Bhatia. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var v : UIView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        addView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func addView(){
        v = UIView(frame: CGRect(x: 0.0, y: 0.0, width: 100, height: 200))
        v.backgroundColor = UIColor.red
        view.addSubview(v)
        v.translatesAutoresizingMaskIntoConstraints = false
//        addConstraints(childView: v, parentView: self.view, leadingConstant: 8.0, trailingConstant: -8.0, topConstant: 100.0, heightConstant: 100)
        addConstraintsForCenter(childView: v, parentView: self.view, widthConstant: 200, heightConstant: 200)
        addMoreSubView(parentView: v)
    }
    
    func addConstraints(childView:UIView, parentView:UIView, leadingConstant:CGFloat = 0.0, trailingConstant:CGFloat = 0.0, topConstant:CGFloat = 0.0, heightConstant:CGFloat ){
        let leading = NSLayoutConstraint(item: childView, attribute: .leading, relatedBy: .equal, toItem: parentView, attribute: .leading, multiplier: 1, constant: leadingConstant)
        let trailing = NSLayoutConstraint(item: childView, attribute: .trailing, relatedBy: .equal, toItem: parentView, attribute: .trailing, multiplier: 1, constant: trailingConstant)
        let top = NSLayoutConstraint(item: childView, attribute: .top, relatedBy: .equal, toItem: parentView, attribute: .top, multiplier: 1, constant: topConstant)
        let height = NSLayoutConstraint(item: childView, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: heightConstant)
        parentView.addConstraints([leading,trailing,top,height])
    }
    
    func addConstraintsForCenter(childView:UIView,parentView:UIView, widthConstant:CGFloat , heightConstant:CGFloat){
        let verticalCenter = NSLayoutConstraint(item: childView, attribute: .centerY, relatedBy: .equal, toItem: parentView, attribute: .centerY, multiplier: 1, constant: 0)
        let horizontalCenter = NSLayoutConstraint(item: childView, attribute: .centerX, relatedBy: .equal, toItem: parentView, attribute: .centerX, multiplier: 1, constant: 0)
        let height = NSLayoutConstraint(item: childView, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: heightConstant)
        let width = NSLayoutConstraint(item: childView, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: widthConstant)
        parentView.addConstraints([width,verticalCenter,horizontalCenter,height])
    }
    
   
    
    func addMoreSubView(parentView:UIView){
        let v = UIView(frame: parentView.frame)
        v.backgroundColor = UIColor(red: CGFloat(drand48()), green: CGFloat(drand48()), blue: CGFloat(drand48()), alpha: 1.0)
        v.translatesAutoresizingMaskIntoConstraints = false
        parentView.addSubview(v)
        addConstraints(childView: v, parentView: parentView,leadingConstant: 10.0, trailingConstant: -10.0, topConstant:10.0, heightConstant: parentView.frame.height - 20)
       // addConstraintsForCenter(childView: v, parentView: parentView, widthConstant: parentView.frame.width, heightConstant: parentView.frame.width/2)
    }
    
    
}

