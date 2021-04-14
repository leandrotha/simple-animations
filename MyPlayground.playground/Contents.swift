//: A UIKit based Playground for presenting user interface
  
import UIKit
import PlaygroundSupport

class MyViewController : UIViewController {
    override func loadView() {
        let view = UIView()
        view.backgroundColor = .white

        let label = UILabel()
        label.frame = CGRect(x: 150, y: 50, width: 200, height: 20)
        label.text = "Side to side"
        label.textColor = .black
        
        let label2 = UILabel()
        label2.frame = CGRect(x: 150, y: 100, width: 200, height: 20)
        label2.text = "Up and Down"
        label2.textColor = .black
        
        let label3 = UILabel()
        label3.frame = CGRect(x: 150, y: 150, width: 200, height: 20)
        label3.text = "Circle"
        label3.textColor = .black
        
        let label4 = UILabel()
        label4.frame = CGRect(x: 150, y: 200, width: 200, height: 20)
        label4.text = "Infinite"
        label4.textColor = .black
        
        let label5 = UILabel()
        label5.frame = CGRect(x: 150, y: 250, width: 200, height: 20)
        label5.text = "Sine"
        label5.textColor = .black
        
        let label6 = UILabel()
        label6.frame = CGRect(x: 150, y: 300, width: 200, height: 20)
        label6.text = "Cosine"
        label6.textColor = .black
        
        view.addSubview(label)
        view.addSubview(label2)
        view.addSubview(label3)
        view.addSubview(label4)
        view.addSubview(label5)
        view.addSubview(label6)
        
        self.view = view
        
        Animator.animateSideToSide(view: label, withDuration: 5)
        Animator.animateUpAndDown(view: label2, withDuration: 5)
        Animator.animateCircle(view: label3, withDuration: 5)
        Animator.animateInfiniteSymbol(view: label4, withDuration: 5)
        Animator.animateSineWave(view: label5, withDuration: 5)
        Animator.animateCosineWave(view: label6, withDuration: 5)
    }
}

// Present the view controller in the Live View window
PlaygroundPage.current.liveView = MyViewController()
