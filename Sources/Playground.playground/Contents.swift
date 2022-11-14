//: A UIKit based Playground for presenting user interface
  
import UIKit
import PlaygroundSupport
import HashRainbow

class MyViewController : UIViewController {
    override func loadView() {
        let view = UIView()
        view.backgroundColor = .white
        let AllPalettes = [GrayscaleColors, RainbowColors, NeonColors, PastelColors, SixColors]
        
        for colorPalette in AllPalettes {
            let yOrigin = AllPalettes.firstIndex(of: colorPalette)! * 50
            for color in colorPalette {
                let colorView = UIView()
                let xOrigin = colorPalette.firstIndex(of: color)! * 50;
                colorView.frame = CGRect(x: xOrigin, y: yOrigin, width: 50, height: 50)
                colorView.backgroundColor = UIColor(color)
                colorView.layer.borderWidth = 1
                colorView.layer.borderColor = CGColor(gray: 1, alpha: 1)
                view.addSubview(colorView)
            }
        }

        let label = UILabel()
        label.frame = CGRect(x: 150, y: 400, width: 200, height: 20)
        label.text = "Hello World!"
        let col = HashRainbow.colorForString("Hello World!", colors: RainbowColors)
        label.textColor = UIColor(col)
        
        
        view.addSubview(label)
        self.view = view
    }
}
// Present the view controller in the Live View window
PlaygroundPage.current.liveView = MyViewController()
