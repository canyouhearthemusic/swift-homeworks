import Foundation

struct Task {
    var title: String
    var description: String
    var isCompleted: Bool

    init(title: String, description: String) {
        self.title = title
        self.description = description
        self.isCompleted = false
    }
    
    mutating func completeTask() {
        self.isCompleted = true
    }
}

class TodoList {
    private var taskList: [Task] = []
    
    private func renderInfo(task: Task) {
        print("Title: \(task.title)")
        print("Description: \(task.description)")
        print("Status: \(task.isCompleted ? "Done" : "In-Progress")\n")
    }
    
    private func getAllTasks(sortedTaskList: [Task]) {
        for task in sortedTaskList {
            renderInfo(task: task)
        }
    }
    
    func getAllTasks() {
        for task in taskList {
            renderInfo(task: task)
        }
    }
    
    func add(task: Task) {
        taskList.append(task)
    }
    
    func remove(title: String) {
        if let id = taskList.firstIndex(where: { $0.title == title }) {
            taskList.remove(at: id)
        } else {
            print("Task wasn't found")
        }
    }
    
    func completeTask(title: String) {
        if let id = taskList.firstIndex(where: { $0.title == title }) {
            taskList[id].completeTask()
        } else {
            print("Task wasn't found")
        }
    }
    
    func listTasksByOrder() {
        for (id, task) in taskList.enumerated() {
            print("ID: \(id)")
            renderInfo(task: task)
        }
    }
    
    func getCompletedTasks() {
        let sortedTaskList = taskList.filter { $0.isCompleted }
        
        getAllTasks(sortedTaskList: sortedTaskList)
    }
    
    func getInProgressTasks() {
        let sortedTaskList = taskList.filter { !$0.isCompleted }
        
        getAllTasks(sortedTaskList: sortedTaskList)
    }
    
    func deleteCompletedTasks() {
        taskList = taskList.filter { !$0.isCompleted }
      }
}

var todoList = TodoList()

var task_1 = Task(title: "Do Homework", description: "Math p.128 ex:1,3,4")
var task_2 = Task(title: "Play Videogames", description: "Play some ranked matches with friends")
var task_3 = Task(title: "Find a Job", description: "Well-Paid, remote")
var task_4 = Task(title: "Accidently task", description: "sdjakdljsal")

todoList.add(task: task_1)
todoList.add(task: task_2)
todoList.add(task: task_3)
todoList.add(task: task_4)

print("1. Getting all tasks\n")
todoList.getAllTasks()

print("2. Deleting 'Accidently task'\n")
todoList.remove(title: "Accidently task")

print("3. Completing task by title\n")
todoList.completeTask(title: "Do Homework")

print("4. Getting all tasks by order\n")
todoList.listTasksByOrder()

print("5. Getting all completed tasks\n")
todoList.getCompletedTasks()

print("6. Getting all in-progress tasks\n")
todoList.getInProgressTasks()

print("7. Deleting completed tasks\n")
todoList.deleteCompletedTasks()

print("8. Make sure that 'Do Homework' task has been deleted\n")
todoList.getAllTasks()
