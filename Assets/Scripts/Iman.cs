using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Iman : MonoBehaviour
{
    public Material mat;
    public Transform go;

    void Update()
    {
        if (go)
        {
            mat.SetVector("_MagnetDir", (transform.position - go.position).normalized);
        }
        else
        {
            mat.SetVector("_MagnetPos", transform.position);
        }
    }
}