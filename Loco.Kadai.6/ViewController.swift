import UIKit

class ViewController: UIViewController {
    @IBOutlet weak private var slider: UISlider!
    @IBOutlet weak private var currentNumberLabel: UILabel!

    private var correctAnswer = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        makeInitialScreen()
    }

    // 初期画面を作る
    private func makeInitialScreen() {
        correctAnswer = Int.random(in: 1...100)
        currentNumberLabel.text = String(correctAnswer)
        slider.value = 50
    }

    // アラート機能
    private func makeAndDisplayAlert(message: String) {
        let alert = UIAlertController(title: "結果", message: message, preferredStyle: .alert)

        let tryAgain = UIAlertAction(
            title: "再挑戦",
            style: .default,
            handler: { [weak self] _ in
                self?.makeInitialScreen()
            }
        )

        alert.addAction(tryAgain)
        present(alert, animated: true)
    }

    @IBAction private func judgeButton(_ sender: Any) {
        let sliderValue = Int(slider.value)

        if correctAnswer == sliderValue {
            makeAndDisplayAlert(message: "あたり！\nあなたの値:\(sliderValue)")
        } else {
            makeAndDisplayAlert(message: "はずれ！\nあなたの値:\(sliderValue)")
        }
    }
}
