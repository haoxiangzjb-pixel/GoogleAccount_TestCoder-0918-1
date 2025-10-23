using UnityEngine;

public class ObjectMover : MonoBehaviour
{
    public float movementSpeed = 7.5f; // Adjustable speed
    
    void FixedUpdate()
    {
        // Move the object forward using physics for smoother movement
        transform.position += transform.forward * movementSpeed * Time.fixedDeltaTime;
    }
}