using UnityEngine;

public class ForwardMover_TWSyMh7M : MonoBehaviour
{
    public float speed = 5.0f;  // Speed of movement
    private Rigidbody rb;

    void Start()
    {
        // Get the Rigidbody component attached to the object
        rb = GetComponent<Rigidbody>();
    }

    void Update()
    {
        // Move the object forward along its local Z-axis
        transform.Translate(Vector3.forward * speed * Time.deltaTime);
        
        // Alternative method using Rigidbody (if the object has one)
        // if (rb != null)
        // {
        //     rb.velocity = transform.forward * speed;
        // }
    }
}