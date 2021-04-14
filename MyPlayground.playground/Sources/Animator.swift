import UIKit

public class Animator {
    public static func animateSideToSide(view: UIView, withDuration duration: Double, xVariation: CGFloat = 100) {
        UIView.animate(withDuration: duration, delay: 0.2, options: [.autoreverse, .repeat], animations: {
            view.center.x -= xVariation
        })
    }
    
    public static func animateUpAndDown(view: UIView, withDuration duration: Double, yVariation: CGFloat = 100) {
        UIView.animate(withDuration: duration, delay: 0.2, options: [.autoreverse, .repeat], animations: {
            view.center.y -= yVariation
        })
    }
    
    public static func animateCircle(view: UIView, withDuration duration: Double, radius: Double = 50) {
        let animation = Builder.buildStandardAnimation(withDuration: duration)

        animation.values = (0..<360).map({ (x: Int) -> NSValue in
            let xPos = cos(Double(x).radians)
            let yPos = sin(Double(x).radians)

            let point = CGPoint(x: xPos * radius, y: yPos * radius)
            return NSValue(cgPoint: point)
        })
        
        view.layer.add(animation, forKey: "basic")
    }
    
    public static func animateInfiniteSymbol(view: UIView, withDuration duration: Double, amplitude: Double = 50, longitude: Double = 50) {
        let animation = Builder.buildStandardAnimation(withDuration: duration)

        let lowerBound = -0.5 * Double.pi
        let upperBound = 1.5 * Double.pi
        
        animation.values = stride(from: lowerBound, to: upperBound, by: 0.05).map { (x: Double) -> NSValue in
            let xPos = cos(x)
            let yPos = sin(x) * cos(x)

            let point = CGPoint(x: xPos * longitude, y: yPos * amplitude)
            return NSValue(cgPoint: point)
        }
        
        view.layer.add(animation, forKey: "basic")
    }
    
    public static func animateSineWave(view: UIView, withDuration duration: Double, amplitude: Double = 50, longitude: Double = 1) {
        let animation = Builder.buildStandardAnimation(withDuration: duration)

        animation.values = (0..<360).map({ (x: Int) -> NSValue in
            let xPos = Double(x)
            let yPos = sin(Double(x).radians)

            let point = CGPoint(x: xPos * longitude, y: yPos * amplitude)
            return NSValue(cgPoint: point)
        })
        
        view.layer.add(animation, forKey: "basic")
    }
    
    public static func animateCosineWave(view: UIView, withDuration duration: Double, amplitude: Double = 50, longitude: Double = 1) {
        let animation = Builder.buildStandardAnimation(withDuration: duration)

        animation.values = (0..<360).map({ (x: Int) -> NSValue in
            let xPos = Double(x)
            let yPos = cos(Double(x).radians)

            let point = CGPoint(x: xPos * longitude, y: yPos * amplitude)
            return NSValue(cgPoint: point)
        })
        
        view.layer.add(animation, forKey: "basic")
    }
}


fileprivate struct Builder {
    fileprivate static func buildStandardAnimation(withDuration duration: Double) -> CAKeyframeAnimation {
        let animation = CAKeyframeAnimation()
        animation.keyPath = "position"
        animation.duration = duration
        animation.repeatCount = .infinity
        animation.isAdditive = true
        
        return animation
    }
}

fileprivate extension Double {
    var radians: Double {
        get {
            return self * Double.pi / 180
        }
    }
}
