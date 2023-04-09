//
//  ResultViewController.swift
//  PersonalQuiz
//
//  Created by Alexey Efimov on 06.04.2023.
//

import UIKit

final class ResultViewController: UIViewController {
    // MARK: - IB Outlets
    @IBOutlet var iconAnimalLabel: UILabel!
    @IBOutlet var descriptionLabel: UILabel!
    
    // MARK: - Public Properties
    var answersChosen: [Answer]!
    
    // MARK: - Private Properties
    private var resultAnswer: Answer!

    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.setHidesBackButton(true, animated: false)
        
        resultAnswer = findResultAnswer(in: answersChosen)
        iconAnimalLabel.text = "Вы - \(resultAnswer.animal.rawValue)"
        descriptionLabel.text = resultAnswer.animal.definition
    }
    
    // MARK: - IB Actions
    @IBAction func doneButtonPressed(_ sender: UIBarButtonItem) {
        dismiss(animated: true)
    }
    
    deinit {
        print("\(type(of: self)) has been deallocated")
    }
    
    // MARK: - Private Methods
    private func findResultAnswer(in answers: [Answer]) -> Answer {
        let groupedAnswersDict = Dictionary(grouping: answers, by: {$0})
        let countAnswersDict = groupedAnswersDict.mapValues({ $0.count })
        
        return countAnswersDict.sorted(by: {$0.value > $1.value}).first!.key
    }
}
