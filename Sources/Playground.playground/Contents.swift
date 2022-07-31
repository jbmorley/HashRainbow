//: A UIKit based Playground for presenting user interface
  
import UIKit
import PlaygroundSupport
import HashRainbow

class MyViewController : UIViewController {
    override func loadView() {
        let view = UIView()
        view.backgroundColor = .white

        let label = UILabel()
        label.frame = CGRect(x: 150, y: 200, width: 200, height: 20)
        label.text = "Hello World!"
        let col = HashRainbow.colorForString("Hello World!", colors: RainbowColors)
        label.textColor = UIColor(col)
        
        view.addSubview(label)
        self.view = view
    }
}
// Present the view controller in the Live View window
PlaygroundPage.current.liveView = MyViewController()
