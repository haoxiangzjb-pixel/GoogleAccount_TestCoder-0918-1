using UnityEngine;

public class ForwardMover : MonoBehaviour
{
    public float moveSpeed = 10.0f; // Speed of movement
    
    void Start()
    {
        // Ensure the object moves forward continuously
    }
    
    void Update()
    {
        // Move the object forward in world space
        transform.position += transform.forward * moveSpeed * Time.deltaTime;
    }
}