public class Student_36db9af4b92be81a {
    // 私有属性
    private String name;
    private int age;
    private String studentId;
    private String major;
    private double gpa;

    // 构造函数
    public Student_36db9af4b92be81a(String name, int age, String studentId, String major, double gpa) {
        this.name = name;
        this.age = age;
        this.studentId = studentId;
        this.major = major;
        this.gpa = gpa;
    }

    // 无参构造函数
    public Student_36db9af4b92be81a() {
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
        if (age > 0 && age < 150) { // 年龄合理性检查
            this.age = age;
        } else {
            System.out.println("Invalid age: " + age);
        }
    }

    public void setStudentId(String studentId) {
        this.studentId = studentId;
    }

    public void setMajor(String major) {
        this.major = major;
    }

    public void setGpa(double gpa) {
        if (gpa >= 0.0 && gpa <= 4.0) { // GPA合理性检查
            this.gpa = gpa;
        } else {
            System.out.println("Invalid GPA: " + gpa + " (should be between 0.0 and 4.0)");
        }
    }

    // 显示学生信息的方法
    public void displayInfo() {
        System.out.println("=== Student Information ===");
        System.out.println("Name: " + name);
        System.out.println("Age: " + age);
        System.out.println("Student ID: " + studentId);
        System.out.println("Major: " + major);
        System.out.println("GPA: " + gpa);
        System.out.println("===========================");
    }

    // 计算成绩等级的方法
    public String getGrade() {
        if (gpa >= 3.7) {
            return "A";
        } else if (gpa >= 3.0) {
            return "B";
        } else if (gpa >= 2.0) {
            return "C";
        } else if (gpa >= 1.0) {
            return "D";
        } else {
            return "F";
        }
    }

    // 判断是否为优秀学生（GPA >= 3.5）
    public boolean isExcellentStudent() {
        return gpa >= 3.5;
    }

    // 重写toString方法
    @Override
    public String toString() {
        return "Student_36db9af4b92be81a{" +
                "name='" + name + '\'' +
                ", age=" + age +
                ", studentId='" + studentId + '\'' +
                ", major='" + major + '\'' +
                ", gpa=" + gpa +
                '}';
    }

    // 重写equals方法
    @Override
    public boolean equals(Object obj) {
        if (this == obj) return true;
        if (obj == null || getClass() != obj.getClass()) return false;
        Student_36db9af4b92be81a student = (Student_36db9af4b92be81a) obj;
        return studentId.equals(student.studentId); // 基于学号判断学生是否相同
    }

    // 重写hashCode方法
    @Override
    public int hashCode() {
        return studentId.hashCode();
    }

    // 主方法，用于测试
    public static void main(String[] args) {
        // 创建学生对象
        Student_36db9af4b92be81a student1 = new Student_36db9af4b92be81a("Alice Johnson", 20, "S001", "Computer Science", 3.8);
        Student_36db9af4b92be81a student2 = new Student_36db9af4b92be81a("Bob Smith", 19, "S002", "Mathematics", 3.2);

        // 显示学生信息
        student1.displayInfo();
        student2.displayInfo();

        // 测试其他方法
        System.out.println(student1.getName() + " grade: " + student1.getGrade());
        System.out.println(student1.getName() + " is excellent student: " + student1.isExcellentStudent());

        System.out.println(student2.getName() + " grade: " + student2.getGrade());
        System.out.println(student2.getName() + " is excellent student: " + student2.isExcellentStudent());
    }
}