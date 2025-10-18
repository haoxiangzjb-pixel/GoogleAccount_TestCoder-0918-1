public class Student {
    // 学生信息属性
    private String name;
    private int age;
    private String studentId;
    private String major;
    private double gpa;

    // 构造函数
    public Student(String name, int age, String studentId, String major, double gpa) {
        this.name = name;
        this.age = age;
        this.studentId = studentId;
        this.major = major;
        this.gpa = gpa;
    }

    // 无参构造函数
    public Student() {
        this.name = "";
        this.age = 0;
        this.studentId = "";
        this.major = "";
        this.gpa = 0.0;
    }

    // Getter方法
    public String getName() {
        return name;
    }

    public int getAge() {
        return age;
    }

    public String getStudentId() {
        return studentId;
    }

    public String getMajor() {
        return major;
    }

    public double getGpa() {
        return gpa;
    }

    // Setter方法
    public void setName(String name) {
        this.name = name;
    }

    public void setAge(int age) {
        if (age > 0 && age < 150) { // 验证年龄合理性
            this.age = age;
        } else {
            System.out.println("Invalid age!");
        }
    }

    public void setStudentId(String studentId) {
        this.studentId = studentId;
    }

    public void setMajor(String major) {
        this.major = major;
    }

    public void setGpa(double gpa) {
        if (gpa >= 0.0 && gpa <= 4.0) { // 假设GPA范围为0.0-4.0
            this.gpa = gpa;
        } else {
            System.out.println("Invalid GPA value! GPA should be between 0.0 and 4.0");
        }
    }

    // 其他有用的方法
    public void displayInfo() {
        System.out.println("Student Information:");
        System.out.println("Name: " + name);
        System.out.println("Age: " + age);
        System.out.println("Student ID: " + studentId);
        System.out.println("Major: " + major);
        System.out.println("GPA: " + gpa);
    }

    public boolean isExcellentStudent() {
        return gpa >= 3.5; // GPA 3.5及以上为优秀学生
    }

    public int getGraduationYear(int currentYear) {
        // 假设学生需要4年毕业
        return currentYear + 4;
    }

    public String toString() {
        return "Student{" +
                "name='" + name + '\'' +
                ", age=" + age +
                ", studentId='" + studentId + '\'' +
                ", major='" + major + '\'' +
                ", gpa=" + gpa +
                '}';
    }

    // 主方法用于测试
    public static void main(String[] args) {
        // 创建学生对象
        Student student1 = new Student("Alice", 20, "S001", "Computer Science", 3.8);
        Student student2 = new Student();

        // 显示学生信息
        student1.displayInfo();
        System.out.println("\nStudent 1 is excellent: " + student1.isExcellentStudent());

        // 设置第二个学生的信息
        student2.setName("Bob");
        student2.setAge(19);
        student2.setStudentId("S002");
        student2.setMajor("Mathematics");
        student2.setGpa(3.2);

        System.out.println("\nStudent 2 info: " + student2.toString());
        System.out.println("Student 2 is excellent: " + student2.isExcellentStudent());
        System.out.println("Student 2 graduation year (assuming current year is 2023): " + student2.getGraduationYear(2023));
    }
}