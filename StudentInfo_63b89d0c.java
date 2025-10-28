public class Student {
    // 私有属性
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

    // 默认构造函数
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

    // 业务方法
    public boolean isHonorStudent() {
        return gpa >= 3.5;
    }

    public String getAcademicStanding() {
        if (gpa >= 3.7) {
            return "Dean's List";
        } else if (gpa >= 3.5) {
            return "Honor Roll";
        } else if (gpa >= 2.0) {
            return "Satisfactory";
        } else {
            return "Probation";
        }
    }

    public int getYearsToGraduation() {
        // 假设标准学制为4年
        if (age <= 18) {
            return 4; // 新生
        } else if (age <= 20) {
            return 3;
        } else if (age <= 22) {
            return 2;
        } else {
            return 1;
        }
    }

    @Override
    public String toString() {
        return "Student{" +
                "name='" + name + '\'' +
                ", age=" + age +
                ", studentId='" + studentId + '\'' +
                ", major='" + major + '\'' +
                ", gpa=" + gpa +
                ", academicStanding='" + getAcademicStanding() + '\'' +
                '}';
    }

    // 主方法用于测试
    public static void main(String[] args) {
        // 创建学生对象
        Student student1 = new Student("张三", 20, "2021001", "计算机科学", 3.75);
        Student student2 = new Student("李四", 19, "2021002", "数学", 2.8);

        // 显示学生信息
        System.out.println(student1);
        System.out.println(student2);

        // 测试方法
        System.out.println(student1.getName() + " 是否为优秀学生: " + student1.isHonorStudent());
        System.out.println(student2.getName() + " 的学术状态: " + student2.getAcademicStanding());
        System.out.println(student1.getName() + " 距离毕业还有 " + student1.getYearsToGraduation() + " 年");
    }
}