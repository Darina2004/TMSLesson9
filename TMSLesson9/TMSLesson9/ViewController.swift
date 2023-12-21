//
//  ViewController.swift
//  TMSLesson9
//
//  Created by Mac on 21.12.23.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var ButtonCats: UIButton!
    @IBOutlet weak var ButtonSquare: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func NextButtonCats(_ sender: Any) {
        
        let storyboard = UIStoryboard(name: "Cats", bundle: nil)
        let vc:UIViewController  = storyboard.instantiateViewController(withIdentifier: "NextViewController")
        present(vc, animated: true)
    }
    
    @IBAction func NextButtonSquare(_ sender: Any) {
        
        let storyboard = UIStoryboard(name: "Square", bundle: nil)
        let vc:UIViewController  = storyboard.instantiateViewController(withIdentifier: "Square")
        present(vc, animated: true)
    }
    
    
    
}








//- ДЗ:
//• Функция Random - самостоятельно, найти и изучить применение
//• Игрушка для котиков - появление разноцветного кружочка, по тапу
//исчезает и появляется в новом месте (кодом)
//
//
//• По нажатию кнопки экран заполняется разноцветными квадратами (3 штуки) с
//фиксированной стороной. Квадраты не пересекаются
//
//
//• На экране кружок по центру. Четыре кнопки - вверх, вниз, вправо,
//влево. При нажатии кнопки кружок перемещается на фиксированное
//расстояние. За края экрана не выходит, на кнопки не налезает
//import UIKit
