import UIKit

public extension CGSize {
    public static func / (_ lhs: CGSize, _ rhs: CGFloat) -> CGSize {
        return CGSize(width: lhs.width / rhs, height: lhs.height / rhs)
    }
}
