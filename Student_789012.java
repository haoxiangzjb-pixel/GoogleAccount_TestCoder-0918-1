public class Student_789012 {

    // Private fields to store student information
    private String name;
    private int age;
    private String studentId;
    private double gpa;

    // Constructor to initialize a student object
    public Student_789012(String name, int age, String studentId, double gpa) {
        this.name = name;
        this.age = age;
        this.studentId = studentId;
        this.gpa = gpa;
    }

    // Getter method for name
    public String getName() {
        return name;
    }

    // Setter method for name
    public void setName(String name) {
        this.name = name;
    }

    // Getter method for age
    public int getAge() {
        return age;
    }

    // Setter method for age
    public void setAge(int age) {
        if (age > 0) { // Basic validation
            this.age = age;
        }
    }

    // Getter method for student ID
    public String getStudentId() {
        return studentId;
    }

    // Setter method for student ID
    public void setStudentId(String studentId) {
        this.studentId = studentId;
    }

    // Getter method for GPA
    public double getGpa() {
        return gpa;
    }

    // Setter method for GPA
    public void setGpa(double gpa) {
        if (gpa >= 0.0 && gpa <= 4.0) { // Basic validation
            this.gpa = gpa;
        }
    }

    // Method to display student information
    public void displayInfo() {
        System.out.println("Student Information:");
        System.out.println("Name: " + this.name);
        System.out.println("Age: " + this.age);
        System.out.println("Student ID: " + this.studentId);
        System.out.println("GPA: " + this.gpa);
    }

    // Main method for testing the Student class
    public static void main(String[] args) {
        // Create a new student object
        Student_789012 student1 = new Student_789012("Alice Johnson", 20, "S123456", 3.75);

        // Display the student's information
        student1.displayInfo();

        // Modify some information using setter methods
        student1.setGpa(3.9);
        student1.setAge(21);

        System.out.println("\nAfter updating GPA and Age:");
        student1.displayInfo();
    }
}