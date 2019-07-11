//
//  KataFractionTests.swift
//  KataFractionTests
//
//  Created by Charles-Adrien Fournier on 11/07/2019.
//  Copyright © 2019 Charles-Adrien Fournier. All rights reserved.
//

import XCTest
@testable import KataFraction

class KataFractionTests: XCTestCase {

    override func setUp() {
    }

    override func tearDown() {
    }

    func testTimes() {
        XCTAssertEqual(Fraction(0) * Fraction(0), Fraction(0))
        XCTAssertEqual(Fraction(1) * Fraction(1), Fraction(1))
        XCTAssertEqual(Fraction(1) * Fraction(2), Fraction(2))
        XCTAssertEqual(Fraction(1) * Fraction(1, 2), Fraction(1, 2))
        XCTAssertEqual(Fraction(1) * Fraction(1, 3), Fraction(1, 3))
        XCTAssertEqual(Fraction(1) * Fraction(2, 3), Fraction(2, 3))
        XCTAssertEqual(Fraction(1) * Fraction(3, 4), Fraction(3, 4))
        XCTAssertEqual(Fraction(2) * Fraction(1, 3), Fraction(2, 3))
        XCTAssertEqual(Fraction(2) * Fraction(2, 3), Fraction(4, 3))
        XCTAssertEqual(Fraction(3) * Fraction(2, 3), Fraction(6, 3))
        XCTAssertEqual(Fraction(1, 2) * Fraction(1), Fraction(1, 2))
        XCTAssertEqual(Fraction(1, 3) * Fraction(3), Fraction(3, 3))
        XCTAssertEqual(Fraction(1, 2) * Fraction(1, 2), Fraction(1, 4))
        XCTAssertEqual(Fraction(1, 2) * Fraction(3, 4), Fraction(3, 8))
        XCTAssertEqual(Fraction(2, 3) * Fraction(2, 3), Fraction(4, 9))
        XCTAssertEqual(Fraction(2, 2) * Fraction(1, 2), Fraction(1, 2))

    }

    class Fraction: Equatable, CustomStringConvertible {

        var description: String {
            return "\(numerator)/\(denominator)"
        }

        let numerator: Int

        let denominator: Int

        init(_ numerator: Int, _ denominator: Int) {
            self.numerator = numerator
            self.denominator = denominator
        }

        convenience init(_ numerator: Int) {
            self.init(numerator, 1)
        }



        public static func ==(left: Fraction, right: Fraction) -> Bool {
            return left.numerator == right.numerator && left.denominator == right.denominator
        }

        public static func *(left: Fraction, right: Fraction) -> Fraction {
            if left.isInteger() && right.isInteger() {
                return Fraction(left.numerator * right.numerator)
            }
            return Fraction(left.numerator * right.numerator, left.denominator * right.denominator).simplify()
        }

        private func isInteger() -> Bool {
            return denominator == 1
        }

        private func simplify() -> Fraction {
            return Fraction(numerator, denominator)
        }

        private func gcd() -> Int {

            let bigger = max(numerator, denominator)

            for i in  (1 ... bigger).reversed() {
                if numerator % i == 0 && denominator % i == 0 {
                    return i
                }
            }
            return 1
        }
    }
}


