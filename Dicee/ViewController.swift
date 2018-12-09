//
//  ViewController.swift
//  Dicee
//
//  Created by Lucas Almeida on 30/11/18.
//  Copyright © 2018 Lucas Almeida. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var diceImages = [
        UIImage(named: "dice1"),
        UIImage(named: "dice2"),
        UIImage(named: "dice3"),
        UIImage(named: "dice4"),
        UIImage(named: "dice5"),
        UIImage(named: "dice6"),
    ]
    
    lazy var myBackground: UIImageView = {
        var myImageView = UIImageView()
        myImageView.image = UIImage(named: "newbackground")
        myImageView.translatesAutoresizingMaskIntoConstraints = false
        myImageView.isUserInteractionEnabled = true
        view.addSubview(myImageView)
        return myImageView
    }()
    
    lazy var iconContainer: UIImageView = {
        var myContainer = UIImageView()
        myContainer.translatesAutoresizingMaskIntoConstraints = false
        myBackground.addSubview(myContainer)
        return myContainer
    }()
    
    lazy var myIcon: UIImageView = {
        var myIcon = UIImageView()
        myIcon.image = UIImage(named: "diceeLogo")
        myIcon.contentMode = .scaleAspectFit
        myIcon.translatesAutoresizingMaskIntoConstraints = false
        iconContainer.addSubview(myIcon)
        return myIcon
    }()
    
    lazy var firstDiceContainer: UIImageView = {
        var myContainer = UIImageView()
        myContainer.translatesAutoresizingMaskIntoConstraints = false
        myBackground.addSubview(myContainer)
        return myContainer
    }()
    
    lazy var secondDiceContainer: UIImageView = {
        var myContainer = UIImageView()
        myContainer.translatesAutoresizingMaskIntoConstraints = false
        myBackground.addSubview(myContainer)
        return myContainer
    }()
    
    lazy var myFirstDice: UIImageView = {
        var myDice = UIImageView()
        firstDiceContainer.addSubview(myDice)
        myDice.translatesAutoresizingMaskIntoConstraints = false
        return myDice
    }()
    
    lazy var mySecondDice: UIImageView = {
        var myDice = UIImageView()
        secondDiceContainer.addSubview(myDice)
        myDice.translatesAutoresizingMaskIntoConstraints = false
        return myDice
    }()
    
    lazy var rollButtonContainer: UIImageView = {
        var myContainer = UIImageView()
        myContainer.translatesAutoresizingMaskIntoConstraints = false
        myContainer.isUserInteractionEnabled = true
        myBackground.addSubview(myContainer)
        return myContainer
    }()
    
    lazy var myRollButton: UIButton = {
        var myButton = UIButton()
        myButton.setTitle("Roll", for: .normal)
        myButton.titleLabel?.font = UIFont(name: "HelveticaNeue", size: 40)
        myButton.backgroundColor = UIColor(red: 139/255, green: 0/255, blue: 0/255, alpha: 1)
        myButton.titleEdgeInsets = UIEdgeInsets(top: 5, left: 10, bottom: 5, right: 10)
        myButton.translatesAutoresizingMaskIntoConstraints = false
        myButton.addTarget(self, action: #selector(didRollButtonClick(sender:)), for: .touchUpInside)
        myButton.tag = 1
        rollButtonContainer.addSubview(myButton)
        return myButton
    }()
    
    @objc func didRollButtonClick(sender: UIButton!) {
        updateDiceImages()
    }
    
    func updateDiceImages() {
        let firstDiceRoll = Int.random(in: 0...5)
        let secondDiceRoll = Int.random(in: 0...5)
        myFirstDice.image = diceImages[firstDiceRoll]
        mySecondDice.image = diceImages[secondDiceRoll]
    }
    
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        updateDiceImages()
    }
    
    override func viewWillLayoutSubviews() {
        NSLayoutConstraint.activate([
            myBackground.heightAnchor.constraint(equalTo: view.heightAnchor),
            myBackground.widthAnchor.constraint(equalTo: view.widthAnchor),
                        
            iconContainer.widthAnchor.constraint(equalTo: myBackground.widthAnchor),
            iconContainer.topAnchor.constraint(equalTo: myBackground.topAnchor),
            iconContainer.bottomAnchor.constraint(equalTo: firstDiceContainer.topAnchor),
            
            myIcon.centerXAnchor.constraint(equalTo: iconContainer.centerXAnchor),
            myIcon.centerYAnchor.constraint(equalTo: iconContainer.centerYAnchor),
            
            // first dice container
            firstDiceContainer.heightAnchor.constraint(equalToConstant: 100),
            firstDiceContainer.widthAnchor.constraint(equalTo: myBackground.widthAnchor, multiplier: 0.5),
            firstDiceContainer.leadingAnchor.constraint(equalTo: myBackground.leadingAnchor),
            firstDiceContainer.centerYAnchor.constraint(equalTo: myBackground.centerYAnchor),
            
            // second dice container
            secondDiceContainer.heightAnchor.constraint(equalToConstant: 100),
            secondDiceContainer.widthAnchor.constraint(equalTo: myBackground.widthAnchor, multiplier: 0.5),
            secondDiceContainer.trailingAnchor.constraint(equalTo: myBackground.trailingAnchor),
            secondDiceContainer.centerYAnchor.constraint(equalTo: myBackground.centerYAnchor),
            
            // x = 40, y = 273, 120 x 120
            myFirstDice.heightAnchor.constraint(equalTo: firstDiceContainer.heightAnchor),
            myFirstDice.widthAnchor.constraint(equalToConstant: 100),
            myFirstDice.centerYAnchor.constraint(equalTo: firstDiceContainer.centerYAnchor),
            myFirstDice.centerXAnchor.constraint(equalTo: firstDiceContainer.centerXAnchor),
            
            // x = 215, y = 273, 120 x 120
            mySecondDice.heightAnchor.constraint(equalTo: secondDiceContainer.heightAnchor),
            mySecondDice.widthAnchor.constraint(equalToConstant: 100),
            mySecondDice.centerYAnchor.constraint(equalTo: secondDiceContainer.centerYAnchor),
            mySecondDice.centerXAnchor.constraint(equalTo: secondDiceContainer.centerXAnchor),
            
            // roll btn container
            rollButtonContainer.widthAnchor.constraint(equalTo: myBackground.widthAnchor),
            rollButtonContainer.topAnchor.constraint(equalTo: firstDiceContainer.bottomAnchor),
            rollButtonContainer.bottomAnchor.constraint(equalTo: myBackground.bottomAnchor),
            
            //roll button
            myRollButton.centerXAnchor.constraint(equalTo: rollButtonContainer.centerXAnchor),
            myRollButton.centerYAnchor.constraint(equalTo: rollButtonContainer.centerYAnchor),
            myRollButton.widthAnchor.constraint(equalToConstant: 100),
            myRollButton.heightAnchor.constraint(equalToConstant: 80),
        ])
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        updateDiceImages()
    }
}

