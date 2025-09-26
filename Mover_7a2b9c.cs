using UnityEngine;

public class Mover_7a2b9c : MonoBehaviour
{
    public float speed = 5.0f; // Speed of the movement

    void Update()
    {
        // Move the object forward along its Z-axis
        transform.Translate(Vector3.forward * speed * Time.deltaTime);
    }
}