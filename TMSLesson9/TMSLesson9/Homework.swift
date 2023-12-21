//
//  NextViewController.swift
//  TMSLesson9
//
//  Created by Mac on 21.12.23.
//

import UIKit

class NextViewController: UIViewController {
    
    @IBOutlet weak var ButtonUP: UIButton!
    
    @IBOutlet weak var ButtonLeft: UIButton!
    
    @IBOutlet weak var ButtonDown: UIButton!
    
    @IBOutlet weak var ButtonRight: UIButton!
    
    let moveDistance: CGFloat = 10.0
    let buttonPadding: CGFloat = 160
    
    var circleView: UIView!
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        createCircleView()
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(circleTapped))
        view.addGestureRecognizer(tapGesture)
        
    }
    
    
    @IBAction func MoveUp(_ sender: Any) {
        moveCircleUp()
    }
    
    
    @IBAction func MoveDown(_ sender: Any) {
        moveCircleDown()
    }
    
    @IBAction func MoveLeft(_ sender: Any) {
        moveCircleLeft()
    }
    
    @IBAction func MoveRight(_ sender: Any) {
        moveCircleRight()
    }
    
    
    func createCircleView() {
        let circleSize: CGFloat = 150
        let centerX = view.bounds.midX - circleSize / 2
        let centerY = view.bounds.midY - circleSize / 2
        
        circleView = UIView(frame: CGRect(x: centerX, y: centerY, width: circleSize, height: circleSize))
        circleView.backgroundColor = UIColor.green
        circleView.layer.cornerRadius = circleSize / 2
        view.addSubview(circleView)
        
    }
    
    @objc func circleTapped() {
        let circleSize: CGFloat = 150
        let randomX = CGFloat.random(in: 0...(view.bounds.width - circleSize))
        let randomY = CGFloat.random(in: 0...(view.bounds.height - circleSize))
        UIView.animate(withDuration: 0.3) {
            self.circleView.frame = CGRect(x: randomX, y: randomY, width: circleSize, height: circleSize)
        }
    }
    
    @objc func moveCircleUp() {
        let newPosY = circleView.frame.origin.y - moveDistance
        if newPosY >= buttonPadding {
            UIView.animate(withDuration: 0.3) {
                self.circleView.frame.origin.y = newPosY
            }
        }
    }
    
    
    @objc func moveCircleRight() {
        if circleView.frame.origin.x + circleView.frame.size.width + moveDistance <= view.bounds.width {
            UIView.animate(withDuration: 0.3) {
                self.circleView.frame.origin.x += self.moveDistance
            }
        }
        
    }
    
    @objc func moveCircleLeft() {
        if circleView.frame.origin.x - moveDistance >= 0 {
            UIView.animate(withDuration: 0.3) {
                self.circleView.frame.origin.x -= self.moveDistance
            }
        }
    }
    
    @objc func moveCircleDown() {
        if circleView.frame.origin.y + circleView.frame.size.height + moveDistance <= view.bounds.height {
            UIView.animate(withDuration: 0.3) {
                self.circleView.frame.origin.y += self.moveDistance
            }
        }
    }
    
}




class Square : UIViewController {
    
    
    @IBOutlet var ButtonFillScreen: UIView!
    let squareSideLength: CGFloat = 100.0
    var squares: [UIView] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func PressButtonFillScreen(_ sender: Any) {
        fillScreenWithSquares()
    }
    
    @objc func fillScreenWithSquares() {
        for square in squares {
            square.removeFromSuperview()
        }
        squares.removeAll()
        
       
        for _ in 0..<5 {
            let squareView = generateSquare()
            view.addSubview(squareView)
            squares.append(squareView)
        }
    }
    
    func generateSquare() -> UIView {
        let square = UIView()
        var intersect: Bool
        var randomX: CGFloat
        var randomY: CGFloat
        repeat {
            randomX = CGFloat.random(in: 0...(view.bounds.width - squareSideLength))
            randomY = CGFloat.random(in: 0...(view.bounds.height - squareSideLength))
            let proposedFrame = CGRect(x: randomX, y: randomY, width: squareSideLength, height: squareSideLength)
            intersect = squares.contains { $0.frame.intersects(proposedFrame) }
        } while intersect
        square.frame = CGRect(x: randomX, y: randomY, width: squareSideLength, height: squareSideLength)
        square.backgroundColor = UIColor(
            red: .random(in: 0...1),
            green: .random(in: 0...1),
            blue: .random(in: 0...1),
            alpha: 1.0
        )
        return square
    }
    
        
    }

