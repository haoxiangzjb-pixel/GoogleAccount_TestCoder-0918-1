public class Student {
    // 学生属性
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
        if (age > 0) {
            this.age = age;
        }
    }

    public void setStudentId(String studentId) {
        this.studentId = studentId;
    }

    public void setMajor(String major) {
        this.major = major;
    }

    public void setGpa(double gpa) {
        if (gpa >= 0.0 && gpa <= 4.0) {
            this.gpa = gpa;
        }
    }

    // 业务方法
    public boolean isExcellentStudent() {
        return gpa >= 3.5;
    }

    public String getAcademicStatus() {
        if (gpa >= 3.7) {
            return "Dean's List";
        } else if (gpa >= 3.0) {
            return "Good Standing";
        } else if (gpa >= 2.0) {
            return "Satisfactory";
        } else {
            return "Academic Probation";
        }
    }

    public int getYearsUntilGraduation() {
        // 假设标准学制为4年
        return Math.max(0, 4 - (int)(gpa * 4 / 4.0)); // 简化计算
    }

    public String introduce() {
        return "Hello, I'm " + name + ", a " + age + "-year-old student majoring in " + major + 
               " with student ID " + studentId + ". My current GPA is " + gpa;
    }

    @Override
    public String toString() {
        return "Student{" +
                "name='" + name + '\'' +
                ", age=" + age +
                ", studentId='" + studentId + '\'' +
                ", major='" + major + '\'' +
                ", gpa=" + gpa +
                ", academicStatus='" + getAcademicStatus() + '\'' +
                '}';
    }

    // 静态方法：比较两个学生的GPA
    public static Student compareGPA(Student student1, Student student2) {
        if (student1.gpa > student2.gpa) {
            return student1;
        } else if (student2.gpa > student1.gpa) {
            return student2;
        } else {
            return null; // GPA相等
        }
    }
}