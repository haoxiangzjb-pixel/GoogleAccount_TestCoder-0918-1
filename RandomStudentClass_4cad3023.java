public class Student {
    // 私有成员变量
    private String name;
    private int age;
    private String studentId;
    private double gpa;
    
    // 构造函数
    public Student() {
        this.name = "";
        this.age = 0;
        this.studentId = "";
        this.gpa = 0.0;
    }
    
    public Student(String name, int age, String studentId, double gpa) {
        this.name = name;
        this.age = age;
        this.studentId = studentId;
        this.gpa = gpa;
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
    
    public double getGpa() {
        return gpa;
    }
    
    // Setter方法
    public void setName(String name) {
        this.name = name;
    }
    
    public void setAge(int age) {
        if (age > 0) { // 确保年龄为正数
            this.age = age;
        }
    }
    
    public void setStudentId(String studentId) {
        this.studentId = studentId;
    }
    
    public void setGpa(double gpa) {
        if (gpa >= 0.0 && gpa <= 4.0) { // 确保GPA在合理范围内
            this.gpa = gpa;
        }
    }
    
    // 其他有用的方法
    public boolean isHonorStudent() {
        return gpa >= 3.5;
    }
    
    public String getGradeLevel() {
        if (gpa >= 3.7) {
            return "A+";
        } else if (gpa >= 3.3) {
            return "A";
        } else if (gpa >= 3.0) {
            return "B+";
        } else if (gpa >= 2.7) {
            return "B";
        } else if (gpa >= 2.3) {
            return "C+";
        } else if (gpa >= 2.0) {
            return "C";
        } else {
            return "F";
        }
    }
    
    public void displayInfo() {
        System.out.println("学生信息:");
        System.out.println("姓名: " + name);
        System.out.println("年龄: " + age);
        System.out.println("学号: " + studentId);
        System.out.println("GPA: " + gpa);
        System.out.println("是否优秀学生: " + (isHonorStudent() ? "是" : "否"));
        System.out.println("等级: " + getGradeLevel());
    }
    
    @Override
    public String toString() {
        return "Student{" +
                "name='" + name + '\'' +
                ", age=" + age +
                ", studentId='" + studentId + '\'' +
                ", gpa=" + gpa +
                '}';
    }
    
    // 主方法用于测试
    public static void main(String[] args) {
        // 创建学生对象
        Student student1 = new Student("张三", 20, "2023001", 3.8);
        Student student2 = new Student();
        
        // 显示学生信息
        student1.displayInfo();
        System.out.println();
        
        // 设置第二个学生的信息
        student2.setName("李四");
        student2.setAge(19);
        student2.setStudentId("2023002");
        student2.setGpa(3.2);
        
        System.out.println("第二个学生信息:");
        System.out.println(student2.toString());
        System.out.println("等级: " + student2.getGradeLevel());
    }
}