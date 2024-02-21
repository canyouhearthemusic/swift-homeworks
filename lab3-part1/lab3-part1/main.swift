import Foundation

struct Student
{
    var firstName: String
    var lastName: String
    var gpa: Double
    
    init(firstName: String, lastName: String, gpa: Double) {
        self.firstName = firstName
        self.lastName = lastName
        self.gpa = gpa
    }
}

class StudentJournal
{
    private var listOfStudents: [Student] = []
    
    private func renderInfo(student: Student) {
        print("First Name: \(student.firstName)")
        print("Last Name: \(student.lastName)")
        print("GPA: \(student.gpa)\n")
    }
    
    private func getAllStudents(studentsList: [Student]) {
        for student in studentsList {
            renderInfo(student: student)
        }
    }
    
    func getAllStudents() {
        for student in listOfStudents {
            renderInfo(student: student)
        }
    }
    
    func add(student: Student) {
        listOfStudents.append(student)
    }
    
    func remove(firstName: String, lastName: String) {
        if let id = listOfStudents.firstIndex(where: { $0.firstName == firstName && $0.lastName == lastName }) {
            listOfStudents.remove(at: id)
        } else {
            print("Student wasn't found")
        }
    }
    
    func orderByDescGPA() {
        let sortedStudentsList = listOfStudents.sorted { $0.gpa > $1.gpa }
        
        getAllStudents(studentsList: sortedStudentsList)
    }
    
    func getAvgGPA() {
        let totalGrade = listOfStudents.reduce(0, { (acc, student) in
            acc + student.gpa
        })
        
        print(totalGrade / Double(listOfStudents.count))
    }
    
    func getSmartestStudent() {
        let smartestStudent = listOfStudents.sorted { $0.gpa > $1.gpa }[0]
        
        renderInfo(student: smartestStudent)
    }
}

var journal = StudentJournal()

var Kanye = Student(firstName: "Kanye", lastName: "West", gpa: 3.5)
var Isaiah = Student(firstName: "Isaiah", lastName: "Rashad", gpa: 3.8)
var Franklin = Student(firstName: "Franklin", lastName: "Saint", gpa: 4)


journal.add(student: Kanye)
journal.add(student: Isaiah)
journal.add(student: Franklin)

print("1. Getting all students\n")
journal.getAllStudents()

print("2. Removing Isaiah Rashad from journal\n")
journal.remove(firstName: "Isaiah", lastName: "Rashad")

print("3. Make sure that Isaiah Rashad was removed from journal\n")
journal.getAllStudents()

print("4. Sorting by descending student's GPA\n")
journal.orderByDescGPA()

print("5. Getting the smartest student of journal(expected object: Franklin Saint)\n")
journal.getSmartestStudent()

print("6. Getting the average GPA among all students in the journal\n")
journal.getAvgGPA()
