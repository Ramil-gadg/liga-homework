import UIKit


enum LessonType {
    case math(rating: Int)
    case ntiveLanguage(rating: Int)
    case computerSince(rating: Int)
    case literature(rating: Int)
}

/// Задание №1
/// Написать код, где можно будет сравнивать перечисления.
/// Где перечисления могут быть =>, >, <=, < исходя их rating и их названия самого перечисления
protocol Comparablee {
    static func <= (lhs: Self, rhs: Self) -> Bool
    static func >= (lhs: Self, rhs: Self) -> Bool
    static func < (lhs: Self, rhs: Self) -> Bool
    static func > (lhs: Self, rhs: Self) -> Bool
}

/// Задание №2
/// Реализуйте протокол Equitable у LessonType
protocol Equatablee {
    static func == (lhs: Self, rhs: Self) -> Bool
}

extension LessonType: Comparablee {
    
    static func <= (lhs: LessonType, rhs: LessonType) -> Bool {
        switch (lhs, rhs) {
        case (.math(let a), .math(let b)):
            return a <= b
        case (.ntiveLanguage(let a), .ntiveLanguage(let b)):
            return a <= b
        case (.computerSince(let a), .computerSince(let b)):
            return a <= b
        case (.literature(let a), .literature(let b)):
            return a <= b
        default:
            return false
        }
    }
    
    static func >= (lhs: LessonType, rhs: LessonType) -> Bool {
        switch (lhs, rhs) {
        case (.math(let a), .math(let b)):
            return a >= b
        case (.ntiveLanguage(let a), .ntiveLanguage(let b)):
            return a >= b
        case (.computerSince(let a), .computerSince(let b)):
            return a >= b
        case (.literature(let a), .literature(let b)):
            return a >= b
        default:
            return false
        }
    }
    
    static func < (lhs: LessonType, rhs: LessonType) -> Bool {
        switch (lhs, rhs) {
        case (.math(let a), .math(let b)):
            return a < b
        case (.ntiveLanguage(let a), .ntiveLanguage(let b)):
            return a < b
        case (.computerSince(let a), .computerSince(let b)):
            return a < b
        case (.literature(let a), .literature(let b)):
            return a < b
        default:
            return false
        }
    }
    
    static func > (lhs: LessonType, rhs: LessonType) -> Bool {
        switch (lhs, rhs) {
        case (.math(let a), .math(let b)):
            return a > b
        case (.ntiveLanguage(let a), .ntiveLanguage(let b)):
            return a > b
        case (.computerSince(let a), .computerSince(let b)):
            return a > b
        case (.literature(let a), .literature(let b)):
            return a > b
        default:
            return false
        }
    }
}

extension LessonType: Equatablee {
    static func == (lhs: LessonType, rhs: LessonType) -> Bool {
        switch (lhs, rhs) {
        case (.math(let a), .math(let b)):
            return a == b
        case (.ntiveLanguage(let a), .ntiveLanguage(let b)):
            return a == b
        case (.computerSince(let a), .computerSince(let b)):
            return a == b
        case (.literature(let a), .literature(let b)):
            return a == b
        default:
            return false
        }
    }
}

print(LessonType.math(rating: 5) > LessonType.math(rating: 4))
print(LessonType.ntiveLanguage(rating: 1) < LessonType.ntiveLanguage(rating: 4))
print(LessonType.literature(rating: 4) >= LessonType.literature(rating: 4))
print(LessonType.computerSince(rating: 3) <= LessonType.computerSince(rating: 3))
print(LessonType.math(rating: 7) > LessonType.computerSince(rating: 3))

print(LessonType.math(rating: 2) == LessonType.math(rating: 1))


