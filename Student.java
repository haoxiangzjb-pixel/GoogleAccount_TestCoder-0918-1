import java.util.ArrayList;
import java.util.List;

public class Student {
    private String name;
    private int age;
    private String studentId;
    private List<Double> grades;

    // Constructor
    public Student(String name, int age, String studentId) {
        this.name = name;
        this.age = age;
        this.studentId = studentId;
        this.grades = new ArrayList<>();
    }

    // Getter methods
    public String getName() {
        return name;
    }

    public int getAge() {
        return age;
    }

    public String getStudentId() {
        return studentId;
    }

    public List<Double> getGrades() {
        return new ArrayList<>(grades); // Return a copy to maintain encapsulation
    }

    // Setter methods
    public void setName(String name) {
        this.name = name;
    }

    public void setAge(int age) {
        if (age > 0) { // Basic validation
            this.age = age;
        }
    }

    public void setStudentId(String studentId) {
        this.studentId = studentId;
    }

    // Method to add a grade
    public void addGrade(double grade) {
        if (grade >= 0.0 && grade <= 100.0) { // Basic validation
            grades.add(grade);
        } else {
            System.out.println("Invalid grade. Grade must be between 0.0 and 100.0.");
        }
    }

    // Method to calculate average grade
    public double calculateAverageGrade() {
        if (grades.isEmpty()) {
            return 0.0;
        }
        double sum = 0.0;
        for (double grade : grades) {
            sum += grade;
        }
        return sum / grades.size();
    }

    @Override
    public String toString() {
        return String.format("Student{name='%s', age=%d, studentId='%s', averageGrade=%.2f}",
                name, age, studentId, calculateAverageGrade());
    }

    // Example usage
    public static void main(String[] args) {
        Student student1 = new Student("Alice", 20, "S001");
        student1.addGrade(85.5);
        student1.addGrade(92.0);
        student1.addGrade(78.5);

        System.out.println(student1);
    }
}