import UIKit

class ViewController: UIViewController {
    @IBOutlet weak private var slider: UISlider!
    @IBOutlet weak private var currentNumberLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        makeInitialScreen()
    }
    // 初期画面を作る
    private func makeInitialScreen() {
        var currentNumber = 0
        currentNumber = Int.random(in: 1...100)
        currentNumberLabel.text = String(currentNumber)
        slider.value = 50
    }
    // アラート機能
    private func makeAndDisplayAlert(message: String) {
        let alert: UIAlertController = UIAlertController(title: "結果", message: message, preferredStyle: .alert)
        let tryAgain = UIAlertAction(title: "再挑戦", style: .default, handler: { [weak self] _ -> Void in self!.makeInitialScreen()
        })

        alert.addAction(tryAgain)
        present(alert, animated: true)
    }

    @IBAction private func judgeButton(_ sender: Any) {
        let sliderValue = String(Int(slider.value))

        if currentNumberLabel.text == sliderValue {
            makeAndDisplayAlert(message: "あたり！\nあなたの値:\(sliderValue)")
        } else {
            makeAndDisplayAlert(message: "はずれ！\nあなたの値:\(sliderValue)")
        }
    }
}
