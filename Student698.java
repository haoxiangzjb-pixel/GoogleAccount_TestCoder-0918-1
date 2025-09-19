public class Student698 {
    // 学生属性
    private String name;
    private int id;
    private int age;
    private String major;
    private double gpa;

    // 构造函数
    public Student698(String name, int id, int age, String major, double gpa) {
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
        System.out.println("学生姓名: " + name);
        System.out.println("学生ID: " + id);
        System.out.println("年龄: " + age);
        System.out.println("专业: " + major);
        System.out.println("GPA: " + gpa);
    }

    // 判断学生是否优秀（GPA >= 3.5）
    public boolean isExcellent() {
        return gpa >= 3.5;
    }

    // 主方法，用于测试
    public static void main(String[] args) {
        // 创建一个学生对象
        Student698 student = new Student698("张三", 698, 20, "计算机科学", 3.8);
        
        // 显示学生信息
        student.displayInfo();
        
        // 判断学生是否优秀
        if (student.isExcellent()) {
            System.out.println(student.getName() + "是一名优秀学生！");
        } else {
            System.out.println(student.getName() + "需要继续努力！");
        }
    }
}