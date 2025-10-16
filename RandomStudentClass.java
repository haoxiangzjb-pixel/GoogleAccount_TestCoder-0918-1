import java.util.ArrayList;
import java.util.List;

public class RandomStudentClass {
    // 私有属性
    private String name;
    private int id;
    private int age;
    private String major;
    private List<Double> grades;
    
    // 构造函数
    public RandomStudentClass(String name, int id, int age, String major) {
        this.name = name;
        this.id = id;
        this.age = age;
        this.major = major;
        this.grades = new ArrayList<>();
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
    
    // 获取专业
    public String getMajor() {
        return major;
    }
    
    // 设置专业
    public void setMajor(String major) {
        this.major = major;
    }
    
    // 添加成绩
    public void addGrade(double grade) {
        if (grade >= 0 && grade <= 100) {
            grades.add(grade);
        } else {
            System.out.println("成绩必须在0-100之间！");
        }
    }
    
    // 计算平均成绩
    public double getAverageGrade() {
        if (grades.isEmpty()) {
            return 0.0;
        }
        
        double sum = 0;
        for (double grade : grades) {
            sum += grade;
        }
        return sum / grades.size();
    }
    
    // 获取所有成绩
    public List<Double> getGrades() {
        return new ArrayList<>(grades); // 返回副本以保护内部数据
    }
    
    // 判断学生是否及格（平均分>=60）
    public boolean isPassing() {
        return getAverageGrade() >= 60.0;
    }
    
    // 显示学生信息
    public void displayInfo() {
        System.out.println("=== 学生信息 ===");
        System.out.println("姓名: " + name);
        System.out.println("学号: " + id);
        System.out.println("年龄: " + age);
        System.out.println("专业: " + major);
        System.out.println("成绩: " + grades);
        System.out.println("平均分: " + String.format("%.2f", getAverageGrade()));
        System.out.println("是否及格: " + (isPassing() ? "是" : "否"));
        System.out.println("================");
    }
    
    // 重写toString方法
    @Override
    public String toString() {
        return "Student{" +
                "name='" + name + '\'' +
                ", id=" + id +
                ", age=" + age +
                ", major='" + major + '\'' +
                ", averageGrade=" + String.format("%.2f", getAverageGrade()) +
                '}';
    }
    
    // 主方法用于测试
    public static void main(String[] args) {
        // 创建学生对象
        RandomStudentClass student = new RandomStudentClass("张三", 2021001, 20, "计算机科学");
        
        // 添加成绩
        student.addGrade(85.5);
        student.addGrade(92.0);
        student.addGrade(78.5);
        student.addGrade(88.0);
        
        // 显示学生信息
        student.displayInfo();
        
        // 测试其他方法
        System.out.println("学生是否及格: " + student.isPassing());
        System.out.println("学生对象信息: " + student.toString());
    }
}