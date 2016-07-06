//
//  ViewController.swift
//  FunWithViews
//
//  Created by James Campagno on 6/1/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

	// Left Corners
	@IBOutlet weak var leftTopCorner: UIView!
	@IBOutlet weak var leftBottomCorner: UIView!
	
	// Right Corners
	@IBOutlet weak var rightTopCorner: UIView!
	@IBOutlet weak var rightBottomCorner: UIView!
	
	// Left & Right Middle
	@IBOutlet weak var leftMiddle: UIView!
	@IBOutlet weak var rightMiddle: UIView!
	
	// Center
	@IBOutlet weak var center: UIView!
	
	// Roll Labels
	@IBOutlet weak var firstRollLabel: UILabel!
	@IBOutlet weak var secondRollLabel: UILabel!
	@IBOutlet weak var thirdRollLabel: UILabel!
	@IBOutlet weak var fourthRollLabel: UILabel!
	@IBOutlet weak var fifthRollLabel: UILabel!
	@IBOutlet weak var sixthRollLabel: UILabel!
	
	var diceSymbolViews: [UIView] = []
	
	var currentTurn = 0
	var currentRoll = 0
	
	override func viewDidLoad() {
		super.viewDidLoad()

		self.setupForNewGame()
		self.diceSymbolViews = [leftTopCorner, leftMiddle, leftBottomCorner,
														rightTopCorner, rightMiddle, rightBottomCorner,
														center]
	}
	
	func setupForNewGame() {

		// Hide all Views
		for subview in self.view.subviews {
			if !(subview is UIButton) {
				subview.hidden = true
			}
		}
		
	}
	
	// Returns back a random Int (1, 2, 3, 4, 5, or 6)
	func randomDiceRoll() -> Int {
		return Int(arc4random_uniform(6) + 1)
	}
	
	@IBAction func rollDie(sender: AnyObject) {
		
		if currentTurn == 6 {
			currentTurn = 0
			self.setupForNewGame()
		}
		
		currentTurn += 1
		
		// Random dice roll
		currentRoll = randomDiceRoll()
		
		// Update UI
		self.updateLabelUI(forRoll: currentTurn)
		self.updateViewUI(forNumberShownOnDie: currentRoll)
		
	}
	
	func updateLabelUI(forRoll rollCount: Int) {
		
		let theLabel: UILabel
		
		switch rollCount {
			
		case 1: theLabel = firstRollLabel
		case 2: theLabel = secondRollLabel
		case 3: theLabel = thirdRollLabel
		case 4: theLabel = fourthRollLabel
		case 5: theLabel = fifthRollLabel
		case 6: theLabel = sixthRollLabel
		default: theLabel = firstRollLabel
			
		}
	
		theLabel.text = "\(self.currentRoll)"
		theLabel.hidden = false
		
	}
	/*
	Dice are in an array with the below indicies
		0		3
		1	6	4
		2		5
	*/
	func updateViewUI(forNumberShownOnDie number: Int) {
		
		switch number {
		case 1: showDice([6])
		case 2: showDice([0, 5])
		case 3: showDice([2, 3, 6])
		case 4: showDice([0, 2, 3, 5])
		case 5: showDice([0, 2, 3, 5 ,6])
		case 6: showDice([0, 1, 2, 3, 4, 5])
		default: showDice([0])
			
		}
	}
	
	// Show all Inidicies in array
	// hide all others
	func showDice(dice: [Int]) {
	
		for (index, element) in self.diceSymbolViews.enumerate() {
			if dice.contains(index) {
				element.hidden = false
			}
			else {
				element.hidden = true
			}
		}
	}
	
	
}























