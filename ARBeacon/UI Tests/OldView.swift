import SwiftUI
import simd

struct TestView2: View {
//
    @ObservedObject var taskContent = ReadData()

    var body: some View {

        VStack {
            Text("Read Data")
            List(taskContent.tasks) { task in
                Text(task.taskName)
                
//                if task.subTasks.count() > 0 {
//                    List(task.subTasks) { subTask in
//                        Text(subTask.subTaskName)
//                    }
//                }
            }
        }
    }
    
//    @ObservedObject var taskContent = ReadTestData()
//
//    var body: some View {
//
//        VStack {
//            Text("Read Data")
//            List {
//                ForEach(taskContent.users) {user in
//                    Text("\(user.name)")
//                }
//            }
//        }
//    }
}



struct TestView2_Previews: PreviewProvider {

    static var previews: some View {

        TestView2()

    }
}

