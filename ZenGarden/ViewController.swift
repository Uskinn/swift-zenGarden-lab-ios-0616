//
//  ViewController.swift
//  ZenGarden
//
//  Created by Flatiron School on 6/30/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var shrubImage: UIImageView!
    @IBOutlet weak var swordInRockImage: UIImageView!
    @IBOutlet weak var rockImage: UIImageView!
    @IBOutlet weak var rakeImage: UIImageView!
    
    ////Srub Vars////
    var leftShrubConstraint: NSLayoutConstraint?
    var topShrubConstraint: NSLayoutConstraint?
    var differenceShrubPoint: CGPoint?
    
    ////Sword Vars///
    var leftSwordConstraint: NSLayoutConstraint?
    var topSwordConstraint: NSLayoutConstraint?
    var differenceSwordPoint: CGPoint?
    
    ////Rake Vars////
    
    var rakeLeftConstraint: NSLayoutConstraint?
    var rakeTopConstraint: NSLayoutConstraint?
    var rakeDifferencePoint: CGPoint?
    
    ////Rock Vars////
    
    var rockLeftConstraints: NSLayoutConstraint?
    var rockTopConstraints: NSLayoutConstraint?
    var rockDifferencePoint: CGPoint?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ///Removing All Constraints///////
        self.rockImage.removeConstraints(self.rockImage.constraints)
        self.rockImage.translatesAutoresizingMaskIntoConstraints = false
        
        self.view.removeConstraints(self.view.constraints)
        self.view.translatesAutoresizingMaskIntoConstraints = false
        
        self.swordInRockImage.removeConstraints(self.swordInRockImage.constraints)
        self.swordInRockImage.translatesAutoresizingMaskIntoConstraints = false
        
        self.shrubImage.removeConstraints(self.shrubImage.constraints)
        self.shrubImage.translatesAutoresizingMaskIntoConstraints = false
        
        self.rakeImage.removeConstraints(self.rakeImage.constraints)
        self.rakeImage.translatesAutoresizingMaskIntoConstraints = false
        
        ////Constraints for Rock////
        self.rockTopConstraints = self.rockImage.topAnchor.constraintEqualToAnchor(self.view.topAnchor)
        self.rockTopConstraints?.active = true
        self.rockImage.heightAnchor.constraintEqualToAnchor(self.view.heightAnchor, multiplier: 0.3).active = true
        self.rockImage.widthAnchor.constraintEqualToAnchor(self.view.widthAnchor, multiplier: 0.3).active = true
        self.rockLeftConstraints = self.rockImage.leftAnchor.constraintEqualToAnchor(self.view.leftAnchor)
        self.rockLeftConstraints?.active = true
        self.rockTopConstraints?.constant = 150
        
        ////Constraints for Rake////////////////////
        self.rakeTopConstraint = self.rakeImage.topAnchor.constraintEqualToAnchor(self.view.topAnchor)
        self.rakeTopConstraint?.active = true
        self.rakeImage.heightAnchor.constraintEqualToAnchor(self.view.heightAnchor, multiplier: 0.3).active = true
        self.rakeImage.widthAnchor.constraintEqualToAnchor(self.view.widthAnchor, multiplier: 0.3).active = true
        self.rakeLeftConstraint = self.rakeImage.leftAnchor.constraintEqualToAnchor(self.view.leftAnchor)
        self.rakeLeftConstraint?.active = true
        self.rakeTopConstraint?.constant = 310
        
        ////Constraints for Shrub////////////////////////
        self.topShrubConstraint = self.shrubImage.topAnchor.constraintEqualToAnchor(self.view.topAnchor)
        self.topShrubConstraint?.active = true
        self.shrubImage.heightAnchor.constraintEqualToAnchor(self.view.heightAnchor, multiplier: 0.3).active = true
        self.shrubImage.widthAnchor.constraintEqualToAnchor(self.view.widthAnchor, multiplier: 0.3).active = true
        self.leftShrubConstraint = self.shrubImage.leftAnchor.constraintEqualToAnchor(self.view.leftAnchor)
        self.leftShrubConstraint?.active = true
        
        ////Constraints for Sword////////////////
        self.topSwordConstraint = self.swordInRockImage.topAnchor.constraintEqualToAnchor(self.view.topAnchor)
        self.topSwordConstraint?.active = true
        self.swordInRockImage.heightAnchor.constraintEqualToAnchor(self.view.heightAnchor, multiplier: 0.3).active = true
        self.swordInRockImage.widthAnchor.constraintEqualToAnchor(self.view.widthAnchor, multiplier: 0.3).active = true
        self.leftSwordConstraint = self.swordInRockImage.leftAnchor.constraintEqualToAnchor(self.view.leftAnchor)
        self.leftSwordConstraint?.active = true
        self.topSwordConstraint?.constant = 530
        
        // Touches///
        let dragShrubRecognizer = UIPanGestureRecognizer.init(target: self, action: #selector(self.draggingShrubImage))
        self.shrubImage.addGestureRecognizer(dragShrubRecognizer)
        
        let dragSwordRecognizer = UIPanGestureRecognizer.init(target: self, action: #selector(self.draggingSwordImage))
        self.swordInRockImage.addGestureRecognizer(dragSwordRecognizer)
        
        let dragRakeRecognizer = UIPanGestureRecognizer.init(target: self, action: #selector(self.draggingRakeImage))
        self.rakeImage.addGestureRecognizer(dragRakeRecognizer)
        
        let dragRockRecognizer = UIPanGestureRecognizer.init(target: self, action: #selector(self.draggingRockImage))
        self.rockImage.addGestureRecognizer(dragRockRecognizer)
    }
    
    ////Dragging Rock Picture///
    func draggingRockImage(recognizer: UIPanGestureRecognizer) {
        let coordinates = recognizer.translationInView(self.rockImage)
        if recognizer.state == .Began {
            self.rockDifferencePoint = coordinates
        } else {
            if let differencePoint = self.rockDifferencePoint {
                let diffY = coordinates.y - differencePoint.y
                let diffX = coordinates.x - differencePoint.x
                
                self.rockTopConstraints?.constant += diffY
                self.rockLeftConstraints?.constant += diffX
                self.rockDifferencePoint = coordinates
            }
        }
    }
    
    ////Dragging Rake Picture////
    func draggingRakeImage(recognizer: UIPanGestureRecognizer) {
        let coordinates = recognizer.translationInView(self.rakeImage)
        if recognizer.state == .Began {
            self.rakeDifferencePoint = coordinates
        } else {
            if let differencePoint = self.rakeDifferencePoint {
                let diffY = coordinates.y - differencePoint.y
                let diffX = coordinates.x - differencePoint.x
                
                self.rakeTopConstraint?.constant += diffY
                self.rakeLeftConstraint?.constant += diffX
                self.rakeDifferencePoint = coordinates
            }
        }
    }
    
    ////Draggind Shrub Picture/////
    func draggingShrubImage(recognizer: UIPanGestureRecognizer) {
        let coordinates = recognizer.translationInView(self.shrubImage)
        if recognizer.state == .Began {
            self.differenceShrubPoint = coordinates
        } else {
            if let differencePoint = self.differenceShrubPoint {
                let diffY = coordinates.y - differencePoint.y
                let diffX = coordinates.x - differencePoint.x
                
                self.topShrubConstraint?.constant += diffY
                self.leftShrubConstraint?.constant += diffX
                self.differenceShrubPoint = coordinates
                
                //print(coordinates)
            }
        }
    }
    
    ////Dragging Sword Image
    func draggingSwordImage(recognizer: UIPanGestureRecognizer) {
        let coordinates = recognizer.translationInView(self.swordInRockImage)
        if recognizer.state == .Began {
            self.differenceSwordPoint = coordinates
        } else {
            if let differencePoint = self.differenceSwordPoint {
                let diffY = coordinates.y - differencePoint.y
                let diffX = coordinates.x - differencePoint.x
                
                self.topSwordConstraint?.constant += diffY
                self.leftSwordConstraint?.constant += diffX
                self.differenceSwordPoint = coordinates
                
                // print(coordinates)
            }
        }
    }
}

