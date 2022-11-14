import SwiftUI
import CryptoKit

// todo come up with some better color defaults\
public let GrayscaleColors = [Color.black, Color.gray, Color.white]
public let RainbowColors = [
    Color.red,
    Color.orange,
    Color.yellow,
    Color.green,
    Color.blue,
    Color.purple]
public let NeonColors = [
    Color(red: 255/255, green: 49/255, blue: 49/255), // neon red
    Color(red: 1, green: 95/255, blue: 31/255), // neon orange
    Color(red: 1, green: 242/255, blue: 5/255), // neon yellow
    Color(red: 15/255, green: 1, blue: 80/255), // neon green
    Color(red: 31/255, green: 81/255, blue: 255/255), // neon blue
    Color(red: 1, green: 16/255, blue: 240/255) // neon purple
]
public let PastelColors = [
    Color(red: 250/255, green: 160/255, blue: 160/255), // pastel red
    Color(red: 250/255, green: 200/255, blue: 152/255), // pastel orange
    Color(red: 1, green: 250/255, blue: 160/255), // pastel yellow
    Color(red: 193/255, green: 225/255, blue: 193/255), // pastel green
    Color(red: 167/255, green: 199/255, blue: 231/255), // pastel blue
    Color(red: 195/255, green: 177/255, blue: 225/255) // pastel purple
]
public let SixColors = [
    Color(red: 231/255, green: 82/255, blue: 79/255), // red
    Color(red: 249/255, green: 148/255, blue: 39/255), // orange
    Color(red: 253/255, green: 194/255, blue: 51/255), // yellow
    Color(red: 115/255, green: 194/255, blue: 91/255), // green
    Color(red: 39/255, green: 174/255, blue: 227/255), // blue
    Color(red: 168/255, green: 86/255, blue: 169/255) // purple
]

// todo add secondary colors to expand selection to # of colors
private func generateColorArray(colors: [Color]) -> [Color] {
    return colors
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
    let colorArray = generateColorArray(colors: RainbowColors)
    return colorForString(text, colors: colorArray)
}

public func colorForString(_ text: String, colors: [Color]) -> Color {
    let hashValue = hashValueFor(text)
    let colorIndex = hashValue % UInt32(colors.count)
    return colors[Int(colorIndex)]
}
