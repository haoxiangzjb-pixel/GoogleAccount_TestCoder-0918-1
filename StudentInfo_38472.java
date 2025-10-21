/**
 * StudentInfo class represents a student with their basic information
 * and provides methods to manage and display student data.
 */
public class StudentInfo_38472 {
    // Private fields to store student information
    private String name;
    private int id;
    private String email;
    private int age;
    private String major;
    
    // Default constructor
    public StudentInfo_38472() {
        this.name = "";
        this.id = 0;
        this.email = "";
        this.age = 0;
        this.major = "";
    }
    
    // Parameterized constructor
    public StudentInfo_38472(String name, int id, String email, int age, String major) {
        this.name = name;
        this.id = id;
        this.email = email;
        this.age = age;
        this.major = major;
    }
    
    // Getter methods
    public String getName() {
        return name;
    }
    
    public int getId() {
        return id;
    }
    
    public String getEmail() {
        return email;
    }
    
    public int getAge() {
        return age;
    }
    
    public String getMajor() {
        return major;
    }
    
    // Setter methods
    public void setName(String name) {
        this.name = name;
    }
    
    public void setId(int id) {
        this.id = id;
    }
    
    public void setEmail(String email) {
        this.email = email;
    }
    
    public void setAge(int age) {
        if (age > 0) { // Age must be positive
            this.age = age;
        }
    }
    
    public void setMajor(String major) {
        this.major = major;
    }
    
    // Method to display student information
    public void displayStudentInfo() {
        System.out.println("Student Information:");
        System.out.println("Name: " + name);
        System.out.println("ID: " + id);
        System.out.println("Email: " + email);
        System.out.println("Age: " + age);
        System.out.println("Major: " + major);
    }
    
    // Method to check if student is an adult
    public boolean isAdult() {
        return age >= 18;
    }
    
    // Method to update student's major
    public void changeMajor(String newMajor) {
        this.major = newMajor;
        System.out.println(name + " has changed major to " + newMajor);
    }
    
    // Method to update contact information
    public void updateContact(String newEmail) {
        this.email = newEmail;
        System.out.println("Contact information updated for " + name);
    }
    
    // Override toString method for easy display
    @Override
    public String toString() {
        return "Student{" +
                "name='" + name + '\'' +
                ", id=" + id +
                ", email='" + email + '\'' +
                ", age=" + age +
                ", major='" + major + '\'' +
                '}';
    }
    
    // Main method for testing
    public static void main(String[] args) {
        // Create a new student
        StudentInfo_38472 student1 = new StudentInfo_38472("Alice Johnson", 12345, "alice.johnson@university.edu", 20, "Computer Science");
        
        // Display student information
        student1.displayStudentInfo();
        System.out.println();
        
        // Test isAdult method
        System.out.println(student1.getName() + " is adult: " + student1.isAdult());
        
        // Change major
        student1.changeMajor("Mathematics");
        
        // Update contact info
        student1.updateContact("alice.j@university.edu");
        
        // Display updated information using toString
        System.out.println("\nUpdated information:");
        System.out.println(student1.toString());
        
        // Create another student using default constructor
        StudentInfo_38472 student2 = new StudentInfo_38472();
        student2.setName("Bob Smith");
        student2.setId(67890);
        student2.setEmail("bob.smith@university.edu");
        student2.setAge(19);
        student2.setMajor("Physics");
        
        System.out.println("\nSecond student info:");
        student2.displayStudentInfo();
    }
}