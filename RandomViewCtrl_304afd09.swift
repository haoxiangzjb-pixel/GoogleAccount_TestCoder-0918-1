import UIKit

class MainViewController: UIViewController {
    
    // MARK: - IBOutlets
    @IBOutlet weak var titleLabel: UILabel?
    @IBOutlet weak var actionButton: UIButton?
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupNavigation()
    }
    
    // MARK: - UI Setup
    private func setupUI() {
        view.backgroundColor = .systemBackground
        titleLabel?.text = "Welcome to the App"
        titleLabel?.textAlignment = .center
        titleLabel?.font = UIFont.preferredFont(forTextStyle: .title1)
        
        actionButton?.setTitle("Tap Me", for: .normal)
        actionButton?.backgroundColor = .systemBlue
        actionButton?.setTitleColor(.white, for: .normal)
        actionButton?.layer.cornerRadius = 8
    }
    
    private func setupNavigation() {
        title = "Main View"
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    // MARK: - Actions
    @IBAction func actionButtonTapped(_ sender: UIButton) {
        let alert = UIAlertController(title: "Hello!", message: "Button was tapped.", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        present(alert, animated: true)
    }
    
    // MARK: - Helpers
    func updateTitle(_ newTitle: String) {
        titleLabel?.text = newTitle
    }
}