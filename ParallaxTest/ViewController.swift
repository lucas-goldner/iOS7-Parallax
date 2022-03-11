//
//  ViewController.swift
//  ParallaxTest
//
//  Created by Dylan McDonald on 3/4/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var mainImage: UIImageView!
    @IBOutlet weak var firstAnswerBox: UIView!
    @IBOutlet weak var secondAnswerBox: UIView!
    @IBOutlet weak var thirdAnswerBox: UIView!
    @IBOutlet weak var answerBox: UIView!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

        //mainImage.layer.masksToBounds = true
        //mainImage.layer.cornerRadius = 30
        //mainImage.layer.cornerCurve = .continuous
        makeRoundedAndBeautiful(view: mainView)
        makeRoundedAndBeautiful(view: firstAnswerBox)
        makeRoundedAndBeautiful(view: secondAnswerBox)
        makeRoundedAndBeautiful(view: thirdAnswerBox)
        makeRoundedAndBeautiful(view: answerBox)
    
        addParallaxToView(view: mainView, amount: 20)
        addShadowParallaxToView(view: mainView, amount: 20)
        addParallaxToView(view: firstAnswerBox, amount: 20)
        addShadowParallaxToView(view: firstAnswerBox, amount: 20)
        addParallaxToView(view: secondAnswerBox, amount: 20)
        addShadowParallaxToView(view: secondAnswerBox, amount: 20)
        addParallaxToView(view: thirdAnswerBox, amount: 20)
        addShadowParallaxToView(view: thirdAnswerBox, amount: 20)
 
    }
}

func makeRoundedAndBeautiful(view: UIView){
    view.layer.masksToBounds = false
    view.layer.cornerRadius = 30
    view.layer.cornerCurve = .continuous
    view.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMaxXMinYCorner, .layerMinXMaxYCorner, .layerMinXMinYCorner]
    view.layer.shadowColor = UIColor.black.cgColor
    view.layer.shadowOffset = CGSize(width: 0, height: 1)
    view.layer.shadowRadius = 15
    view.layer.shadowOpacity = 0.7
}


func addParallaxToView(view: UIView, amount: Float) {
    let horizontal = UIInterpolatingMotionEffect(keyPath: "center.x", type: .tiltAlongHorizontalAxis)
    horizontal.minimumRelativeValue = -amount
    horizontal.maximumRelativeValue = amount

    let vertical = UIInterpolatingMotionEffect(keyPath: "center.y", type: .tiltAlongVerticalAxis)
    vertical.minimumRelativeValue = -amount
    vertical.maximumRelativeValue = amount

    let group = UIMotionEffectGroup()
    group.motionEffects = [horizontal, vertical]
    view.addMotionEffect(group)
    
    NotificationCenter.default.addObserver(forName:  Notification.Name(rawValue: "UpdateParallax") , object: nil, queue: .main) { notification in
        UIView.animate(withDuration: 0.25) {
            view.removeMotionEffect(group)
        }
    }
}

func addShadowParallaxToView(view: UIView, amount: Float) {
    let horizontal = UIInterpolatingMotionEffect(keyPath: "layer.shadowOffset.width", type: .tiltAlongHorizontalAxis)
    horizontal.minimumRelativeValue = amount
    horizontal.maximumRelativeValue = -amount

    let vertical = UIInterpolatingMotionEffect(keyPath: "layer.shadowOffset.height", type: .tiltAlongVerticalAxis)
    vertical.minimumRelativeValue = amount
    vertical.maximumRelativeValue = -amount

    let group = UIMotionEffectGroup()
    group.motionEffects = [horizontal, vertical]
    view.addMotionEffect(group)
    
    NotificationCenter.default.addObserver(forName:  Notification.Name(rawValue: "UpdateParallax") , object: nil, queue: .main) { notification in
        UIView.animate(withDuration: 0.25) {
            view.removeMotionEffect(group)
        }
    }
}

