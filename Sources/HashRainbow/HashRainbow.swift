import SwiftUI
import CryptoKit

private let DefaultNumberOfColors = 8
public let GrayscaleColors = [Color.black, Color.gray, Color.white]
public let RainbowColors = [Color.red, Color.orange, Color.yellow, Color.green, Color.blue, Color.purple]

private func generateColorArray(numColors: Int, colors: [Color]) -> [Color] {
    return GrayscaleColors
}

func hashValueFor(_ text: String) -> UInt32 {
    let stringData = text.data(using: .utf8) ?? Data()
    let digest = SHA256.hash(data: stringData)
    let hashPrefix = digest.withUnsafeBytes { pointer in
        return pointer.load(as: UInt32.self)
    }
    return hashPrefix
}

public func colorForString(_ text: String) -> Color {
    // generate color array based on inputs
    let colorArray = generateColorArray(numColors: DefaultNumberOfColors, colors: GrayscaleColors)
    return colorForString(text, colors: colorArray)
}

public func colorForString(_ text: String, colors: [Color]) -> Color {
    let hashValue = hashValueFor(text)
    let colorIndex = hashValue % UInt32(colors.count)
    return colors[Int(colorIndex)]
}
