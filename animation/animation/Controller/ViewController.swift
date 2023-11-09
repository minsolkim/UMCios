//
//  ViewController.swift
//  animation
//
//  Created by 김민솔 on 2023/11/07.
//
import UIKit
import Lottie
import Hero
class ViewController: UIViewController {
    // 1. Create the LottieAnimationView
    //private var animationView: LottieAnimationView?
    // Create the LottieAnimationView for 'panda'
    private var pandaAnimationView: LottieAnimationView?
        // Create the LottieAnimationView for 'letter'
    private var letterAnimationView: LottieAnimationView?
    @IBOutlet weak var grayview: UIView!
    @IBOutlet weak var pinkview: UIView!
    
    override func viewDidLoad() {
        pinkview.hero.id = "pinkview"
        grayview.hero.id = "grayview"
        super.viewDidLoad()
        
        // Start LottieAnimationView with animation name 'panda'
                pandaAnimationView = .init(name: "panda")

                // Set the desired frame and content mode for 'panda'
                pandaAnimationView!.frame = CGRect(x: 0, y: 0, width: 200, height: 200) // Adjust the size as needed
                pandaAnimationView!.contentMode = .scaleAspectFit

                // Set animation loop mode and speed for 'panda'
                pandaAnimationView!.loopMode = .loop
                pandaAnimationView!.animationSpeed = 1.5

                // Play 'panda' animation
                pandaAnimationView!.play()

                // Add 'panda' animation view to the view hierarchy
                view.addSubview(pandaAnimationView!)

                // Bring 'panda' animation view to the front
                view.bringSubviewToFront(pandaAnimationView!)

                // Set the position of 'panda' animation view
                pandaAnimationView!.center = view.center

                // Start LottieAnimationView with animation name 'letter'
                letterAnimationView = .init(name: "letter")

                // Set the desired frame and content mode for 'letter'
                letterAnimationView!.frame = CGRect(x: 0, y: 0, width: 200, height: 200) // Adjust the size as needed
                letterAnimationView!.contentMode = .scaleAspectFit

                // Set animation loop mode and speed for 'letter'
                letterAnimationView!.loopMode = .loop
        letterAnimationView!.animationSpeed = 0.5

                // Play 'letter' animation
                letterAnimationView!.play()

                // Add 'letter' animation view above 'panda' animation view
                view.addSubview(letterAnimationView!)

                // Set the position of 'letter' animation view (e.g., adjust x and y values)
                letterAnimationView!.center = CGPoint(x: 100, y: 100) // Adjust the position as needed
            }

    
    @IBAction func nextView(_ sender: Any) {
        print("button action")
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let target = storyboard.instantiateViewController(withIdentifier: "SecondViewController")
        target.hero.isEnabled = true
        target.hero.modalAnimationType = .selectBy(presenting: .fade, dismissing: .fade)
        present(target, animated: true, completion: nil)
    }
    
}
