using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Rotate2 : MonoBehaviour
{
    float timeCounter = 0;

    float speed;
    float width;
    float height;

    void Start()
    {
        speed = 1;
        width = 6;
        height = 3;
    }

    // Update is called once per frame
    void Update()
    {
        timeCounter += Time.deltaTime * speed;

        float x = -6;
        float y = 5;
        float z = Mathf.Sin(timeCounter) + 5;

        transform.position = new Vector3(x, y, z);
    }
}
