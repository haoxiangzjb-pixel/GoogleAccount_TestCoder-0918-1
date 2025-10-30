import UIKit

class MyViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set up the view
        setupView()
    }
    
    private func setupView() {
        // Configure the view's appearance
        view.backgroundColor = .systemBackground
        
        // Add a label as an example
        let label = UILabel()
        label.text = "Hello, iOS!"
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(label)
        
        // Set up constraints
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
    
    override func loadView() {
        super.loadView()
        // Custom view loading can be implemented here if needed
    }
    
    // Additional methods can be added as needed
}