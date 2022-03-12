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
    @IBOutlet weak var mainQuestion: UILabel!
    @IBOutlet weak var firstAnswerBox: UIView!
    @IBOutlet weak var firstAnswerLabel: UILabel!
    @IBOutlet weak var secondAnswerBox: UIView!
    @IBOutlet weak var secondAnswerLabel: UILabel!
    @IBOutlet weak var thirdAnswerBox: UIView!
    @IBOutlet weak var thirdAnswerLabel: UILabel!
    @IBOutlet weak var answerBox: UIView!
    @IBOutlet weak var ALabel: UILabel!
    @IBOutlet weak var BLabel: UILabel!
    @IBOutlet weak var CLabel: UILabel!
    var firstAnswerBoxPosition = CGPoint(x: 0, y: 0)
    var secondAnswerBoxPosition = CGPoint(x: 0, y: 0)
    var thirdAnswerBoxPosition = CGPoint(x: 0, y: 0)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.firstAnswerBoxPosition = CGPoint(x: firstAnswerBox.layer.position.x - 20, y: firstAnswerBox.layer.position.y)
        self.secondAnswerBoxPosition = CGPoint(x: secondAnswerBox.layer.position.x - 20, y: secondAnswerBox.layer.position.y)
        self.thirdAnswerBoxPosition = CGPoint(x: thirdAnswerBox.layer.position.x - 20, y: thirdAnswerBox.layer.position.y)
        
        //Add drag behaviour
        firstAnswerBox.tag = 1
        secondAnswerBox.tag = 2
        thirdAnswerBox.tag = 3
        var panGestureOne = UIPanGestureRecognizer()
        panGestureOne = UIPanGestureRecognizer(target: self, action: #selector(draggedView(_:)))
        firstAnswerBox.isUserInteractionEnabled = true
        firstAnswerBox.addGestureRecognizer(panGestureOne)
        var panGestureTwo = UIPanGestureRecognizer()
        panGestureTwo = UIPanGestureRecognizer(target: self, action: #selector(draggedView(_:)))
        secondAnswerBox.isUserInteractionEnabled = true
        secondAnswerBox.addGestureRecognizer(panGestureTwo)
        var panGestureThree = UIPanGestureRecognizer()
        panGestureThree = UIPanGestureRecognizer(target: self, action: #selector(draggedView(_:)))
        thirdAnswerBox.isUserInteractionEnabled = true
        thirdAnswerBox.addGestureRecognizer(panGestureThree)
        
        //Round all views
        mainImage.roundCornersForAspectFit(radius: 30)
        makeRoundedAndBeautiful(view: mainQuestion, shadowColor: UIColor.black)
        makeRoundedAndBeautiful(view: mainView, shadowColor: UIColor.systemGreen)
        makeRoundedAndBeautiful(view: firstAnswerBox,  shadowColor: UIColor.systemPink)
        makeRoundedAndBeautiful(view: secondAnswerBox,  shadowColor: UIColor.systemPink)
        makeRoundedAndBeautiful(view: thirdAnswerBox,  shadowColor: UIColor.systemPink)
        makeRoundedAndBeautiful(view: answerBox,  shadowColor: UIColor.systemPink)
        
        //Style labels
        styleLabels(label: ALabel, size: 30.0)
        styleLabels(label: BLabel, size: 30.0)
        styleLabels(label: CLabel, size: 30.0)
        styleLabels(label: firstAnswerLabel, size: 20.0)
        styleLabels(label: secondAnswerLabel, size: 20.0)
        styleLabels(label: thirdAnswerLabel, size: 20.0)
    
        //Apply magic parallax effect
        addParallaxToView(view: mainImage, amount: 20)
        addShadowParallaxToView(view: mainImage, amount: 20)
        addParallaxToView(view: mainView, amount: 20)
        addShadowParallaxToView(view: mainView, amount: 20)
        addParallaxToView(view: mainQuestion, amount: 20)
        addShadowParallaxToView(view: mainQuestion, amount: 20)
        addParallaxToView(view: firstAnswerBox, amount: 20)
        addShadowParallaxToView(view: firstAnswerBox, amount: 20)
        addParallaxToView(view: secondAnswerBox, amount: 20)
        addShadowParallaxToView(view: secondAnswerBox, amount: 20)
        addParallaxToView(view: thirdAnswerBox, amount: 20)
        addShadowParallaxToView(view: thirdAnswerBox, amount: 20)
        addParallaxToView(view: ALabel, amount: 20)
        addShadowParallaxToView(view: ALabel, amount: 20)
        addParallaxToView(view: BLabel, amount: 20)
        addShadowParallaxToView(view: BLabel, amount: 20)
        addParallaxToView(view: CLabel, amount: 20)
        addShadowParallaxToView(view: CLabel, amount: 20)
        addParallaxToView(view: firstAnswerLabel, amount: 20)
        addShadowParallaxToView(view: firstAnswerLabel, amount: 20)
        addParallaxToView(view: secondAnswerLabel, amount: 20)
        addShadowParallaxToView(view: secondAnswerLabel, amount: 20)
        addParallaxToView(view: thirdAnswerLabel, amount: 20)
        addShadowParallaxToView(view: thirdAnswerLabel, amount: 20)
    }
    
    @objc func draggedView(_ sender: UIPanGestureRecognizer){
        self.view.bringSubviewToFront(sender.view!)
        let translation = sender.translation(in: self.view)
        sender.view?.center = CGPoint(x: (sender.view?.center.x)! + translation.x, y: (sender.view?.center.y)! + translation.y)
        sender.setTranslation(CGPoint.zero, in: self.view)
        print(sender.view?.layer.position)
        
        if(answerBox.layer.position.y <= 400 + firstAnswerBox.layer.position.y){
            UIImpactFeedbackGenerator(style: .medium).impactOccurred()
            sender.view?.layer.position = self.firstAnswerBoxPosition
            self.showToast(message: "Wrong answer", font: .systemFont(ofSize: 20.0))
        } else if(answerBox.layer.position.y <= 475 + secondAnswerBox.layer.position.y){
            UIImpactFeedbackGenerator(style: .medium).impactOccurred()
            sender.view?.layer.position = self.firstAnswerBoxPosition
            self.showToast(message: "Correct!", font: .systemFont(ofSize: 20.0))
        } else if(answerBox.layer.position.y <= 515 + thirdAnswerBox.layer.position.y){
            UIImpactFeedbackGenerator(style: .medium).impactOccurred()
            sender.view?.layer.position = self.firstAnswerBoxPosition
            self.showToast(message: "Wrong answer", font: .systemFont(ofSize: 20.0))
        }
        
        if(sender.state == .ended){
            sender.view?.layer.position = self.firstAnswerBoxPosition
        }
    }
    
    func makeRoundedAndBeautiful(view: UIView, shadowColor: UIColor){
        view.layer.masksToBounds = false
        view.layer.cornerRadius = 30
        view.layer.cornerCurve = .continuous
        view.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMaxXMinYCorner, .layerMinXMaxYCorner, .layerMinXMinYCorner]
        view.layer.shadowColor = shadowColor.cgColor
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

    func styleLabels(label: UILabel, size: Double) {
        label.font = UIFont.systemFont(ofSize: size)
        label.layer.masksToBounds = false
        label.layer.shadowRadius = 2.0
        label.layer.shadowOpacity = 0.35
        label.layer.shadowOffset = CGSize(width: 1, height: 2)
    }
}

extension UIImageView {
func roundCornersForAspectFit(radius: CGFloat)
{
    if let image = self.image {
        let boundsScale = self.bounds.size.width / self.bounds.size.height
        let imageScale = image.size.width / image.size.height
        var drawingRect : CGRect = self.bounds
        if boundsScale > imageScale {
            drawingRect.size.width =  drawingRect.size.height * imageScale
            drawingRect.origin.x = (self.bounds.size.width - drawingRect.size.width) / 2
        } else {
            drawingRect.size.height = drawingRect.size.width / imageScale
            drawingRect.origin.y = (self.bounds.size.height - drawingRect.size.height) / 2
        }
        let path = UIBezierPath(roundedRect: drawingRect, cornerRadius: radius)
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        self.layer.mask = mask
        }
    }
}

extension UIGestureRecognizer {
    public enum State : Int {
        case possible = 0
        case began = 1
        case changed = 2
        case ended = 3
        case cancelled = 4
        case failed = 5
    }
}

extension UIViewController {

func showToast(message : String, font: UIFont) {

    let toastLabel = UILabel(frame: CGRect(x: self.view.frame.size.width/2 - 90, y: self.view.frame.size.height-100, width: self.view.frame.size.width / 2, height: 50))
    toastLabel.backgroundColor = UIColor.black.withAlphaComponent(0.6)
    toastLabel.textColor = UIColor.white
    toastLabel.font = font
    toastLabel.textAlignment = .center;
    toastLabel.text = message
    toastLabel.alpha = 1.0
    toastLabel.layer.cornerRadius = 10;
    toastLabel.clipsToBounds  =  true
    self.view.addSubview(toastLabel)
    UIView.animate(withDuration: 4.0, delay: 0.1, options: .curveEaseOut, animations: {
         toastLabel.alpha = 0.0
    }, completion: {(isCompleted) in
        toastLabel.removeFromSuperview()
    })
} }
