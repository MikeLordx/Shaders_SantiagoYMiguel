using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

public class ButtonInteraction : MonoBehaviour
{
    public GameObject _button;
    public Transform _rotation;
    public Transform _scale;

    private void Start()
    {
        _button.SetActive(false);
    }

    private void OnTriggerEnter(Collider other)
    {
        _button.SetActive(true);
    }

    private void OnTriggerExit(Collider other)
    { 
        _button.SetActive(false);
    }

    public void ObjectRotation()
    {
        _rotation.transform.Rotate(0.0f, 90.0f, 0.0f, Space.Self);
    }

    public void ObjectScale()
    {
        _scale.transform.localScale += new Vector3(1, 0, 0);
    }
}
