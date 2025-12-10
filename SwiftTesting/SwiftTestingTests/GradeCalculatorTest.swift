//
//  GradeCalculatorTest.swift
//  SwiftTesting
//
//  Created by eytsam elahi on 10/12/2025.
//

import Testing
@testable import SwiftTesting

struct GradeCalculatorTests {

    @Test func verifying_score_of_85_returns_B() throws {
        let calculator = GradeCalculator()
        let grade = try calculator.calculateGrade(score: 85)
        #expect(grade == "B")
    }

    @Test("Get Grades by providing different scores", arguments: [
        (75, "C"),
        (85, "B"),
        (90, "A"),
        (50, "F")
    ])
    func verifying_different_grades(input: (Int, String)) throws {
        let (score, grade) = input
        let calculator = GradeCalculator()
        let result = try calculator.calculateGrade(score: score)
        #expect(grade == result)
    }

    @Test("Throws invalid error when input value out of range", arguments: [-1, 101, 1000])
    func invalidScoreThrow(score: Int) throws {
        let calculator = GradeCalculator()
        #expect(throws: GradeCalculator.GradeError.invalidScore) {
            try calculator.calculateGrade(score: score)
        }
    }
}
