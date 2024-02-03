import Foundation


func add(_ num1: Double, _ num2: Double) -> Double {
    return num1 + num2
}

func sub(_ num1: Double, _ num2: Double) -> Double {
    return num1 - num2
}

func mul(_ num1: Double, _ num2: Double) -> Double {
    return num1 * num2
}

func divide(_ num1: Double, _ num2: Double) -> Double? {
    guard num2 != 0 else {
        print("Error: Cannot divide by zero.")
        return nil
    }
    return num1 / num2
}

func power(_ num1: Double, _ num2: Double) -> Double {
    return pow(num1, num2)
}

func combine_strings() {
    print("Enter the first line:")
    let line1 = readLine()!
    
    print("Enter the second line:")
    let line2 = readLine()!
    
    print("\n")
    
    let combinedString = line1 + line2
    print(combinedString + "\n")
}

func flip_a_line() {
    print("Enter a string to flip:")
    let stringToFlip = readLine()!
    let flippedString = String(stringToFlip.reversed())
    print("Flipped string: \(flippedString)\n")
}

func count_characters() {
    print("Enter a string to count characters:")
    let stringForCount = readLine()!
    let filteredString = stringForCount.filter { !$0.isWhitespace }
    let characterCount = filteredString.count
    print("Number of characters (excluding spaces): \(characterCount)")
}

func search_for_a_substring() {
    print("Enter a string to search in:")
    let string = readLine()!
    print("Enter a substring to search for:")
    let substring = readLine()!
    
    if let range = string.range(of: substring) {
        let index = range.lowerBound.utf16Offset(in: string)
        print("The index of the matching substring is: \(index)\n")
    } else {
        print("The substring was not found in the string.\n")
    }
}


func task1() {
    print("Enter first number:")
    guard let num1 = Double(readLine() ?? "") else {
        print("Error: Invalid input for the first number.")
        return
    }

    print("Enter second number:")
    guard let num2 = Double(readLine() ?? "") else {
        print("Error: Invalid input for the second number.")
        return
    }

    print("Enter operator (+, -, *, /, ^):")
    guard let operatorInput = readLine() else {
        print("Error: Invalid input for the operator.")
        return
    }

    var result: Double?

    switch operatorInput {
    case "+":
        result = add(num1, num2)
    case "-":
        result = sub(num1, num2)
    case "*":
        result = mul(num1, num2)
    case "/":
        result = divide(num1, num2)
    case "^":
        result = power(num1, num2)
    default:
        print("Error: Invalid operator.")
        return
    }

    if let result = result {
        print("Result: \(result)\n")
    }
}

func task2() {
    print("1. Combining strings")
    print("2. Flip a line")
    print("3. Counting characters")
    print("4. Search for a substring")
    
    let operatorInput = Int(readLine() ?? "")

    switch operatorInput {
        case 1:
            combine_strings()
        case 2:
            flip_a_line()
        case 3:
            count_characters()
        case 4:
            search_for_a_substring()
        default:
            print("Error: Select task between 1-4.")
            return
        }
}

while(true) {
    print("1. Calculator")
    print("2. Processing String data")

    let option = Int(readLine() ?? "")
    
    print("\n")
    
    switch option {
        case 1:
            task1()
        case 2:
            task2()
        default:
            print("Error: Invalid Task\n")
    }
}
