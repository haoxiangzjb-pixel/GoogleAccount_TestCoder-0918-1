public class Student_1759048489510729059 {
    private String name;
    private int age;
    private String studentId;

    public Student_1759048489513795069(String name, int age, String studentId) {
        this.name = name;
        this.age = age;
        this.studentId = studentId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getAge() {
        return age;
    }

    public void setAge(int age) {
        this.age = age;
    }

    public String getStudentId() {
        return studentId;
    }

    public void setStudentId(String studentId) {
        this.studentId = studentId;
    }

    public void displayInfo() {
        System.out.println("Name: " + name + ", Age: " + age + ", ID: " + studentId);
    }

    public static void main(String[] args) {
        Student_1759048489529842869 student = new Student_1759048489531512285("John Doe", 20, "S12345");
        student.displayInfo();
    }
}
