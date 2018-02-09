//
//  ViewController.swift
//  Rock Paper Scissors
//
//  Created by I847323 on 1/31/18.
//  Copyright © 2018 Tyler. All rights reserved.
//

import UIKit

class RPSViewController: UIViewController {

    // MARK: Programmatic Approach
    
    @IBAction private func playRock(sender: UIButton) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "ResultsViewController") as! ResultsViewController
        vc.userChoice = getUserShape(sender: sender)
        present(vc, animated: true, completion: nil)
    }

    // MARK: Segue with Code Approach
    
    @IBAction private func playPaper(sender: UIButton) {
        performSegue(withIdentifier: "play", sender: sender)
    }
    
    // MARK: Segue
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "play" {
            let vc = segue.destination as! ResultsViewController
            vc.userChoice = getUserShape(sender: sender as! UIButton)
        }
    }
    
    // MARK: Utilities
    
    // The enum "Shape" represents a play or move
    private func getUserShape(sender: UIButton) -> Shape {
        // Titles are set to one of: Rock, Paper, or Scissors
        let shape = sender.title(for: UIControlState())!
        return Shape(rawValue: shape)!
    }

}

