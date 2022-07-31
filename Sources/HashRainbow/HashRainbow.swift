import UIKit
import CryptoKit

private let DefaultNumberOfColors = 3
private let GrayscaleColors = [UIColor.black, UIColor.gray, UIColor.white]

private func generateColorArray(numColors: Int, colors: [UIColor]) -> [UIColor] {
    return GrayscaleColors
}

public func colorForString(_ text: String) -> UIColor {
    // generate color array based on inputs
    let colorArray = generateColorArray(numColors: DefaultNumberOfColors, colors: GrayscaleColors)
    
    // hash + modulo the obj
    let digest = Insecure.MD5.hash(data: text.data(using: .utf8) ?? Data())
    let colorIndex = (abs(digest.hashValue)) % DefaultNumberOfColors
    
    return colorArray[colorIndex]
}
