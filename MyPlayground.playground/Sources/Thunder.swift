import UIKit

public class Thunder: UIImageView {
    public var imageDataSource = [UIImage(named: "Raio_principal")!, UIImage(named: "Raio_completo")!]
    public let opacityAnimation = CABasicAnimation(keyPath: "opacity")
    
    override public init(frame: CGRect) {
        super.init(frame: frame)

        animationImages = imageDataSource
        image = imageDataSource.first!
        sizeToFit()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func animateThunder() {
        image = imageDataSource.first!
        
        opacityAnimation.fromValue = 0
        opacityAnimation.toValue = 1
        opacityAnimation.repeatCount = .infinity
        opacityAnimation.duration = 0.15
        opacityAnimation.timingFunction = CAMediaTimingFunction(name: .easeInEaseOut)
        opacityAnimation.delegate = self
        
        layer.add(opacityAnimation, forKey: "opacity")
    }
}

extension Thunder: CAAnimationDelegate {
    public func animationDidStop(_ anim: CAAnimation, finished flag: Bool) {
        if flag {
            image = imageDataSource.last!
        }
    }
}

