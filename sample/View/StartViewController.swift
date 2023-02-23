//
//  StartViewController.swift
//  sample
//
//  Created by Sanish Aukhale on 21/02/23.
//

import UIKit

class StartViewController: UIViewController{
    
    @IBOutlet weak var labelText: UILabel!
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var progressIndicator: UIActivityIndicatorView!
    private var api = APIManager()
    override func viewDidLoad()  {
        loadData()
        super.viewDidLoad()
    }
    
    @IBAction func buttonAction(_ sender: Any)  {
        nextButton.addTarget(self, action: #selector(loadData), for: .touchUpInside)
    }
    
    private var fact: FactModel?
    @objc private func loadData()  {
        progressIndicator.isHidden = false
        progressIndicator.startAnimating()
        labelText.isHidden = true
        api.getFact()
    
        labelText.text = "\(api.fact.text)"
        progressIndicator.isHidden = true
        labelText.isHidden = false
    }
    
    
}
