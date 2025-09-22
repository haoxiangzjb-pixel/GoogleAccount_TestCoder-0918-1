public class StudentRecord {
    // 学生属性
    private String name;
    private int id;
    private int age;
    private String major;
    private double gpa;
    
    // 无参构造函数
    public StudentRecord() {
        this.name = "";
        this.id = 0;
        this.age = 0;
        this.major = "";
        this.gpa = 0.0;
    }
    
    // 有参构造函数
    public StudentRecord(String name, int id, int age, String major, double gpa) {
        this.name = name;
        this.id = id;
        this.age = age;
        this.major = major;
        this.gpa = gpa;
    }
    
    // 获取学生姓名
    public String getName() {
        return name;
    }
    
    // 设置学生姓名
    public void setName(String name) {
        this.name = name;
    }
    
    // 获取学生ID
    public int getId() {
        return id;
    }
    
    // 设置学生ID
    public void setId(int id) {
        this.id = id;
    }
    
    // 获取学生年龄
    public int getAge() {
        return age;
    }
    
    // 设置学生年龄
    public void setAge(int age) {
        this.age = age;
    }
    
    // 获取学生专业
    public String getMajor() {
        return major;
    }
    
    // 设置学生专业
    public void setMajor(String major) {
        this.major = major;
    }
    
    // 获取学生GPA
    public double getGpa() {
        return gpa;
    }
    
    // 设置学生GPA
    public void setGpa(double gpa) {
        this.gpa = gpa;
    }
    
    // 显示学生信息
    public void displayInfo() {
        System.out.println("学生信息:");
        System.out.println("姓名: " + name);
        System.out.println("学号: " + id);
        System.out.println("年龄: " + age);
        System.out.println("专业: " + major);
        System.out.println("GPA: " + gpa);
    }
    
    // 判断学生是否优秀（GPA >= 3.5）
    public boolean isExcellent() {
        return gpa >= 3.5;
    }
    
    // 根据GPA确定学生等级
    public String getGradeLevel() {
        if (gpa >= 3.8) {
            return "优秀";
        } else if (gpa >= 3.0) {
            return "良好";
        } else if (gpa >= 2.0) {
            return "及格";
        } else {
            return "不及格";
        }
    }
    
    // 主方法，用于测试
    public static void main(String[] args) {
        // 创建学生对象
        StudentRecord student1 = new StudentRecord("张三", 1001, 20, "计算机科学", 3.75);
        StudentRecord student2 = new StudentRecord("李四", 1002, 19, "数学", 3.9);
        StudentRecord student3 = new StudentRecord("王五", 1003, 21, "物理", 2.8);
        
        // 显示学生信息
        student1.displayInfo();
        System.out.println("是否优秀: " + student1.isExcellent());
        System.out.println("等级: " + student1.getGradeLevel());
        System.out.println();
        
        student2.displayInfo();
        System.out.println("是否优秀: " + student2.isExcellent());
        System.out.println("等级: " + student2.getGradeLevel());
        System.out.println();
        
        student3.displayInfo();
        System.out.println("是否优秀: " + student3.isExcellent());
        System.out.println("等级: " + student3.getGradeLevel());
    }
}